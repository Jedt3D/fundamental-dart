# Lesson 38 — CSV as a small data pipeline

> This lesson is about treating CSV work like a grown-up would —
> not as a one-off script but as three tiny, replaceable parts:
> **read**, **write**, **query**. It's also your first encounter with
> a real pub.dev dependency: [`package:csv`](https://pub.dev/packages/csv).

## 1. Why CSV still matters

CSV is unglamorous but unavoidable: admin exports, spreadsheet
handoffs, legacy integrations, business intelligence imports. Every
developer ends up parsing it. The instinct — split on commas —
breaks the moment you hit quoted fields with commas inside, embedded
newlines, or fields with escaped quotes. **Don't hand-roll it.**
`package:csv` handles all the edge cases.

## 2. Design thinking — three classes, not one

A single `CsvService.readCategorise(path, category)` is the wrong
shape. Why?

- Tests that care about *query* logic shouldn't have to put files on
  disk.
- The file-reading path can be swapped for a bytes-from-network one
  without rewriting query code.
- New query methods should be simple to add — one method, one
  conjugation of `.where`/`.map`/`.fold`.

So we split into:

1. **`InventoryCsvReader`** — converts a CSV **string** into a
   `List<InventoryRow>`. No file I/O. Tests can hand it a string.
2. **`InventoryCsvWriter`** — goes the other way: takes rows, emits
   a CSV string with a fixed header order.
3. **`InventoryQueries`** — takes a reader + a CSV string, loads the
   rows once in its constructor, then exposes small, composable
   query methods (`.skusInCategory`, `.totalValueCents`,
   `.countByCategory`). Each method is a small fold over the loaded
   rows.

Notice what's missing: there is **no `File`** in the API signatures.
If you want to read a file, you open it with `dart:io` and hand the
string to `parse`. That one-line caller is the only place file I/O
lives — the rest is pure data transformation, which is why it tests
cleanly.

## 3. `InventoryRow` — a record, not a class

A row is just four fields with no behaviour. Records are the right
tool:

```dart
typedef InventoryRow = ({
  String sku,
  String name,
  int priceCents,
  String category,
});
```

Records give you component equality for free, which makes the test
`expect(rows, equals([...]))` read like prose.

## 4. Why `priceCents: int` and not `priceDollars: double`

Money in `double`s loses precision (`0.1 + 0.2 != 0.3`). The rule is:
store currency as an integer number of the smallest unit (cents,
satoshis, yen), do math in ints, only convert to a decimal for
display. It's one of the cheapest bugs to prevent.

## 5. The contract

**`InventoryCsvReader`**

- `List<InventoryRow> parse(String csv)` — expects the first line to
  be the headers `sku,name,price_cents,category` in that order.
  Empty input (no lines, or just the header) returns an empty list.

**`InventoryCsvWriter`**

- `static const List<String> headers = ['sku', 'name', 'price_cents',
  'category'];` — the fixed header order.
- `String toCsv(List<InventoryRow> rows)` — writes header row,
  then each row. Fields are comma-separated, lines are `\n`-terminated.

**`InventoryQueries`**

- `InventoryQueries(InventoryCsvReader reader, String csv)` — loads
  rows once in the constructor by delegating to the reader.
- `List<String> skusInCategory(String category)` — SKUs of rows whose
  `category` matches, in the order they appeared.
- `int totalValueCents()` — sum of `priceCents` across all rows.
- `Map<String, int> countByCategory()` — category → number of rows
  in that category. Use a `fold`, don't mutate an external map.

## 6. Test-driving order

The test file has two groups. Fill them in order.

**Basic** — reader + writer round-trip

1. `parse` of a well-formed three-line CSV returns three records.
2. `parse` of header-only input returns an empty list.
3. `toCsv` writes a header row followed by the rows in order.
4. `parse(toCsv(rows)) == rows` — idempotent round-trip.

**Advanced** — queries + dependency injection

5. `skusInCategory` filters by category, preserving order.
6. `totalValueCents` sums `priceCents`.
7. `countByCategory` groups and counts.
8. `InventoryQueries` delegates its parsing to the injected reader —
   proved with a `FakeReader` that records its calls.

## 7. Run the tests

```bash
cd ex38-csv-pipeline
dart pub get
dart test
```
