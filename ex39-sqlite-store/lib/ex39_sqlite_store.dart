/// Lesson 39 — SQLite store with prepared statements.
///
/// Read `README.md` first — especially the platform note about
/// needing `libsqlite3` installed on Windows.
///
/// Short version: one class for writes and schema, one class for
/// reads, and every query is parameterised so SQL injection can't
/// happen.
library;

import 'package:sqlite3/sqlite3.dart';

// ---------------------------------------------------------------------------
// ProductStore — schema + writes.
// ---------------------------------------------------------------------------

/// Owns the database connection and the write path.
class ProductStore {
  /// Use this constructor when you want to supply your own
  /// `Database` (for example, pointing at a file on disk).
  ProductStore(this.db);

  /// Convenience factory for tests and quick experiments. Opens a
  /// brand-new `:memory:` database and sets up the schema.
  factory ProductStore.openInMemory() {
    final db = sqlite3.openInMemory();
    final store = ProductStore(db);
    store.setupSchema();
    return store;
  }

  /// The raw sqlite3 `Database` handle. Exposed so [ProductQueries]
  /// (and tests) can read from the same connection.
  final Database db;

  /// Create the `products` table if it doesn't exist yet.
  ///
  /// Columns:
  ///   id          INTEGER PRIMARY KEY
  ///   sku         TEXT    NOT NULL UNIQUE
  ///   name        TEXT    NOT NULL
  ///   price_cents INTEGER NOT NULL
  ///   category    TEXT    NOT NULL
  ///
  /// TODO:
  ///   db.execute('''
  ///     CREATE TABLE IF NOT EXISTS products (
  ///       id INTEGER PRIMARY KEY,
  ///       sku TEXT NOT NULL UNIQUE,
  ///       name TEXT NOT NULL,
  ///       price_cents INTEGER NOT NULL,
  ///       category TEXT NOT NULL
  ///     )
  ///   ''');
  void setupSchema() {
    throw UnimplementedError('TODO — create the products table');
  }

  /// Insert a product.
  ///
  /// IMPORTANT: use a **prepared statement with parameters** — don't
  /// splice values into the SQL string. Reach for `db.prepare(...)`
  /// and pass `[sku, name, priceCents, category]` to its
  /// `execute([...])` call.
  void add({
    required String sku,
    required String name,
    required int priceCents,
    required String category,
  }) {
    throw UnimplementedError(
      'TODO: prepared INSERT with four positional parameters',
    );
  }

  /// Close the underlying connection.
  void dispose() => db.dispose();
}

// ---------------------------------------------------------------------------
// ProductQueries — reads, via prepared statements.
//
// Kept separate from the store so read-only consumers can't see the
// schema-editing API. Takes a `Database` directly because it doesn't
// care whether the connection came from a store, a pool, or a test.
// ---------------------------------------------------------------------------

/// Read-only queries against the products table.
class ProductQueries {
  ProductQueries(this._db);
  final Database _db;

  /// Names of products in [category], ordered alphabetically.
  ///
  /// Use a parameterised query — `db.select('SELECT ... WHERE
  /// category = ? ORDER BY name', [category])`. NEVER interpolate
  /// the category into the SQL string.
  List<String> namesInCategory(String category) {
    throw UnimplementedError(
      'TODO — parameterised SELECT, then pluck the name column',
    );
  }

  /// Average price_cents for products in [category], as a `double`.
  ///
  /// If there are no matching rows, return `0.0` (not NaN). SQLite
  /// returns `null` for `AVG` over zero rows — handle that.
  double averagePriceInCategory(String category) {
    throw UnimplementedError('TODO — SELECT AVG(price_cents) ...');
  }

  /// Category → number of products in that category.
  /// One `GROUP BY` query, no loops on the Dart side.
  Map<String, int> countByCategory() {
    throw UnimplementedError('TODO — SELECT category, COUNT(*) GROUP BY');
  }
}
