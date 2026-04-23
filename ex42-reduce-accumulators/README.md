# Lesson 42 — Reduce and accumulator design

> Lesson 41 moved you toward "data in, pipeline, data out". This
> lesson tackles the other half: when the output has a different
> shape from the input — a total, a group, a frequency histogram.
> That's what `fold` is for.

## 1. `fold` — Dart's reduce/inject/foldl

Every language with collections has one: Ruby's `reduce` / `inject`,
JavaScript's `reduce`, Haskell's `foldl`, Python's `functools.reduce`.
In Dart it's `Iterable.fold`:

```dart
final xs = [1, 2, 3, 4];
final sum = xs.fold<int>(0, (acc, x) => acc + x);   // 10
```

Three ingredients:

- the **seed** — the starting accumulator value (`0`);
- the **accumulator** — the running state passed into the next step
  (`acc`);
- the **update rule** — how you combine the current accumulator with
  one element (`(acc, x) => acc + x`).

That's it. If you can describe an aggregation in those three
ingredients, `fold` fits.

Compare the same logic written imperatively:

```dart
var sum = 0;
for (final x in xs) {
  sum += x;
}
```

Both are fine. The fold version signals "I'm aggregating" to the
reader without needing them to trace a mutable variable. Prefer
it when the aggregation is the whole point of the loop, prefer
`for` when you're doing something else (printing, short-circuiting,
side effects).

## 2. Choosing an accumulator shape

The hardest part of `fold` isn't the syntax — it's picking the right
accumulator **shape** for the problem. A few patterns you'll see a
lot:

| Problem | Accumulator shape |
|---|---|
| Sum / product / count | `int` or `double` |
| Max / min | `T` (starting with the first element) |
| Group by key | `Map<K, List<V>>` |
| Frequency count | `Map<K, int>` |
| Multi-field aggregate | a **named record** of the fields |

The last one is the one Dart makes especially pleasant. In Ruby
you'd use a hash; in Dart, a named record gives you the same
readable shape with static type checking:

```dart
final stats = xs.fold<({int sum, int count, int max})>(
  (sum: 0, count: 0, max: 0),
  (acc, x) => (
    sum: acc.sum + x,
    count: acc.count + 1,
    max: x > acc.max ? x : acc.max,
  ),
);
```

Notice that each field is updated in the same step — one pass over
the data, multiple answers out.

## 3. `groupBy` — when the stdlib has exactly what you want

`package:collection` ships `groupBy`, which is the exact tool for
"partition this list by key":

```dart
final byCategory = groupBy(items, (item) => item.category);
// returns Map<String, List<Item>>
```

The lesson asks you to implement the group-by logic **both ways**:

1. Hand-rolled with `fold` into a `Map<String, List<String>>`, to
   feel the accumulator pattern.
2. Once more with `groupBy` from `package:collection`, because in
   real code that's the version you'd ship.

## 4. The contract

**`Transaction`** — our example data shape

- `typedef Transaction = ({String category, int amountCents});`

**`RevenueCalculator`**

- `int totalAmount(List<Transaction> rows)` — sum of `amountCents`.

**`FrequencyCounter`**

- `Map<String, int> countByCategory(List<Transaction> rows)` — via
  `fold`.

**`CatalogGrouper`**

- `typedef CatalogItem = ({String name, String category});`
- `Map<String, List<String>> namesByCategoryManual(List<CatalogItem> items)`
  — build the grouped map with `fold`.
- `Map<String, List<String>> namesByCategoryGroupBy(List<CatalogItem>
  items)` — same result using `groupBy` from `package:collection`.

**`StatsSummary`** — multi-field record accumulator

- `typedef Stats = ({int sum, int count, int max, int min});`
- `Stats summarise(List<int> xs)` — one pass over `xs`, all four
  fields at once. For an empty list, return `(sum: 0, count: 0, max:
  0, min: 0)` (the test tolerates that as the "no data" sentinel).

## 5. Test-driving order

**Basic**

1. `RevenueCalculator.totalAmount` sums `amountCents`.
2. `FrequencyCounter.countByCategory` builds the histogram via `fold`.
3. `CatalogGrouper.namesByCategoryManual` groups by category.

**Advanced**

4. `CatalogGrouper.namesByCategoryGroupBy` returns the same result as
   the manual version.
5. `CatalogGrouper` is idempotent — calling it twice returns an
   equivalent map without mutating prior results.
6. `StatsSummary.summarise` computes sum, count, max, min in one pass.
7. `StatsSummary.summarise([])` returns the zero-sentinel record.
8. Running all aggregators on a shared dataset gives consistent totals
   — same number of rows in `countByCategory` and in
   `namesByCategoryManual`.

## 6. Run the tests

```bash
cd ex42-reduce-accumulators
dart pub get
dart test
```
