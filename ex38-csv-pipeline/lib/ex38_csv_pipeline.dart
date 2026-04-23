/// Lesson 38 — CSV as a small data pipeline.
///
/// Uses [`package:csv`](https://pub.dev/packages/csv) for the
/// parsing/serialisation so we don't reinvent the quoting rules.
///
/// Read `README.md` before starting. Short version: three tiny
/// classes — reader, writer, queries — each with one job.
library;

import 'package:csv/csv.dart';

// ---------------------------------------------------------------------------
// InventoryRow — a named record for "one CSV row".
//
// Ruby would use a symbol-keyed hash here. Records are the Dart 3
// equivalent: same "read like a struct" feel, with type checks on
// every field access.
// ---------------------------------------------------------------------------

/// One inventory item, modelled as a named record. Money is stored
/// in **cents** (int) — never use `double` for currency.
typedef InventoryRow = ({
  String sku,
  String name,
  int priceCents,
  String category,
});

// ---------------------------------------------------------------------------
// InventoryCsvReader — string in, records out.
//
// No file I/O here. If you want to read a file, do it at the call
// site with `dart:io`'s `File(path).readAsStringSync()` and hand the
// string to [parse].
// ---------------------------------------------------------------------------

/// Parses the inventory CSV format.
class InventoryCsvReader {
  /// Parse [csv] into a list of [InventoryRow] records.
  ///
  /// The CSV is expected to have the headers
  ///   sku,name,price_cents,category
  /// in that order on the first line. If the input has only a header
  /// (or is empty), the result is an empty list.
  List<InventoryRow> parse(String csv) {
    // The CsvToListConverter returns a List<List<dynamic>> — one
    // list per row. Use `shouldParseNumbers: false` so all fields
    // come back as `String`, and we explicitly convert price_cents
    // to int where we expect it.
    //
    // Normalise both '\r\n' and '\n' line endings by passing the
    // explicit `eol`. Many CSVs in the wild have CRLF endings.
    //
    // TODO:
    //   1. convert the CSV to rows with CsvToListConverter:
    //        final rows = const CsvToListConverter(
    //          eol: '\n',
    //          shouldParseNumbers: false,
    //        ).convert(csv.replaceAll('\r\n', '\n'));
    //   2. drop the header row (rows.first).
    //   3. map each data row to an InventoryRow record.
    //   4. return the list.
    throw UnimplementedError('TODO');
  }
}

// ---------------------------------------------------------------------------
// InventoryCsvWriter — records in, CSV string out.
// ---------------------------------------------------------------------------

/// Serialises rows back to CSV with a fixed header order.
class InventoryCsvWriter {
  /// The exact header order our CSVs use. Frozen as a const so no
  /// code can accidentally mutate the ordering mid-run.
  static const List<String> headers = [
    'sku',
    'name',
    'price_cents',
    'category',
  ];

  /// Serialise [rows] to a CSV string ending with a trailing newline.
  ///
  /// Uses [ListToCsvConverter] to handle quoting edge cases (commas
  /// inside values, embedded quotes).
  ///
  /// TODO:
  ///   1. build a List<List<Object>> whose first element is [headers]
  ///      and whose subsequent elements are one per row, keyed by
  ///      field (sku, name, priceCents, category).
  ///   2. pass it to const ListToCsvConverter(eol: '\n').convert(...)
  ///      and return the result (append a trailing '\n' if you like —
  ///      the test is tolerant of both).
  String toCsv(List<InventoryRow> rows) {
    throw UnimplementedError('TODO');
  }
}

// ---------------------------------------------------------------------------
// InventoryQueries — small fold-over-data query service.
//
// Takes the reader as a constructor parameter (dependency injection)
// so the tests can substitute a fake reader and confirm the split of
// responsibilities. The actual parsing happens exactly once, in this
// class's constructor.
// ---------------------------------------------------------------------------

/// Runs a handful of reporting-style queries over an in-memory CSV.
class InventoryQueries {
  InventoryQueries(InventoryCsvReader reader, String csv)
      : _rows = reader.parse(csv);

  final List<InventoryRow> _rows;

  /// Read-only access to the loaded rows — handy in tests.
  List<InventoryRow> get rows => List.unmodifiable(_rows);

  /// SKUs of rows whose category equals [category], in original order.
  List<String> skusInCategory(String category) {
    // TODO: _rows.where(...).map(...).toList()
    throw UnimplementedError('TODO');
  }

  /// Sum of priceCents across every row. `fold` is a natural fit.
  int totalValueCents() {
    // TODO: _rows.fold<int>(0, (sum, row) => sum + row.priceCents)
    throw UnimplementedError('TODO');
  }

  /// category → count of rows in that category.
  ///
  /// Build this with `fold` that accumulates into a `Map<String,int>`
  /// — don't mutate an external map. Using fold here also exercises
  /// the accumulator pattern we'll formalise in lesson 42.
  Map<String, int> countByCategory() {
    throw UnimplementedError('TODO');
  }
}
