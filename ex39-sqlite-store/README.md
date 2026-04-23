# Lesson 39 — SQLite store with prepared statements

> Small applications need persistence long before they need a
> framework. SQLite is the ideal teaching tool: no server, no
> credentials, just a file on disk — or, as in this lesson, a
> single in-memory database we tear down between tests.

## 1. Platform prerequisite

This lesson needs the system's **`libsqlite3`** shared library at
runtime — [`package:sqlite3`](https://pub.dev/packages/sqlite3)
loads it dynamically.

- **macOS**: already present, nothing to do.
- **Linux**: `sudo apt install libsqlite3-0` (or your distro's
  equivalent).
- **Windows**: **not** pre-installed. Install it with
  `choco install sqlite` or `winget install SQLite.SQLite`, or
  download `sqlite-dll-win-*.zip` from
  [sqlite.org/download.html](https://sqlite.org/download.html) and
  put `sqlite3.dll` on your `PATH`.

If `libsqlite3` isn't available, `dart pub get` still succeeds but
`dart test` will fail with a loader error — that's telling you the
library is missing, not that the code is wrong.

## 2. Why SQLite, not "a database"

SQLite runs in-process: there's no daemon, no port, no migrations
system to set up. `:memory:` databases live only for the life of the
process, which makes them perfect for unit tests — every test gets a
fresh database, no cleanup, no shared state, and it's fast (tens of
microseconds).

## 3. Design thinking — two classes, one connection

We split the problem into:

1. **`ProductStore`** — opens the connection, owns the schema, does
   writes. Think of it as the "mutable state" side of the domain.
2. **`ProductQueries`** — holds a reference to the same `Database`
   and exposes read-only questions about the data. No schema
   management, no inserts.

Splitting read from write means you can unit-test queries with a
pre-populated DB, and when you later add a read-replica, caching
layer, or HTTP transport, the split already exists.

## 4. Prepared statements, not string interpolation

The single most important habit this lesson teaches:

```dart
// WRONG — vulnerable to injection. A user-supplied `category` of
//   "' OR 1=1; DROP TABLE products; --"
// would happily tear your table down.
final rows = db.select(
  "SELECT name FROM products WHERE category = '$category'",
);

// RIGHT — parameters are bound, quoted, and escaped by SQLite itself.
final rows = db.select(
  'SELECT name FROM products WHERE category = ?',
  [category],
);
```

Prepared statements are also faster on repeat calls: SQLite parses and
plans the SQL once, then reuses that plan for each invocation. We
lean on that in [ProductQueries].

## 5. Money again: `price_cents` as INTEGER

Same rule as the CSV lesson. Currency is an integer count of the
smallest unit. `double` for money is a bug farm.

## 6. The contract

**`ProductStore`**

- `ProductStore.openInMemory()` — factory opening a `:memory:` DB and
  creating the schema immediately. Tests use this exclusively.
- `ProductStore(Database db)` — direct constructor for when you want
  to inject your own connection (e.g. to a file).
- `void setupSchema()` — runs the `CREATE TABLE IF NOT EXISTS`
  statement. Called automatically by `openInMemory()`; you can call
  it again safely (it's idempotent).
- `void add({required String sku, required String name, required
  int priceCents, required String category})` — inserts via a
  prepared statement.
- `void dispose()` — closes the connection.

**`ProductQueries`**

- `ProductQueries(Database db)` — constructor-injected connection.
- `List<String> namesInCategory(String category)` — **must** use a
  parameterised query. Ordered alphabetically by name.
- `double averagePriceInCategory(String category)` — uses SQL's
  `AVG(price_cents)`. Returns 0.0 if the category has no rows (not
  NaN).
- `Map<String, int> countByCategory()` — returns a category → count
  map for every distinct category in the table, via `GROUP BY`.

## 7. Test-driving order

**Basic** — schema and writes

1. `openInMemory` returns a store ready to accept rows.
2. `add` + a raw `SELECT COUNT(*)` confirms the row landed.
3. `setupSchema` is idempotent — calling it twice doesn't blow up.

**Advanced** — queries

4. `namesInCategory` returns rows of the asked-for category, sorted
   by name.
5. `namesInCategory` is safe against injection — a category value
   containing a quote and `OR 1=1` must **not** leak rows of a
   different category.
6. `averagePriceInCategory` averages correctly and returns 0.0 for
   an empty category.
7. `countByCategory` groups per category.

## 8. Run the tests

```bash
cd ex39-sqlite-store
dart pub get
dart test
```
