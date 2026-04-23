/// Lesson 42 — Reduce and accumulator design.
///
/// Read `README.md` first. Short version: `fold` is `reduce` in Dart
/// clothing; the hard part is choosing the right accumulator shape.
/// Named records give us the clarity of Ruby's symbol-keyed hashes
/// with static type checks on every field.
library;

import 'package:collection/collection.dart' show groupBy;

// ---------------------------------------------------------------------------
// Domain records — records, not classes, because they carry no
// behaviour.
// ---------------------------------------------------------------------------

typedef Transaction = ({String category, int amountCents});
typedef CatalogItem = ({String name, String category});
typedef Stats = ({int sum, int count, int max, int min});

// ---------------------------------------------------------------------------
// RevenueCalculator — canonical "sum with fold".
// ---------------------------------------------------------------------------

/// Adds up `amountCents` across every transaction.
class RevenueCalculator {
  /// Sum of [rows]' `amountCents`. Empty list sums to 0.
  int totalAmount(List<Transaction> rows) {
    // TODO: rows.fold<int>(0, (sum, t) => sum + t.amountCents)
    throw UnimplementedError('TODO');
  }
}

// ---------------------------------------------------------------------------
// FrequencyCounter — Map<K, int> accumulator, built in one pass.
// ---------------------------------------------------------------------------

/// Counts how many transactions fall into each category.
class FrequencyCounter {
  /// Build `Map<category, count>`.
  ///
  /// The idiomatic accumulator pattern is:
  ///   rows.fold<Map<String,int>>({}, (acc, t) {
  ///     acc[t.category] = (acc[t.category] ?? 0) + 1;
  ///     return acc;
  ///   });
  ///
  /// Note that we mutate `acc` inside the reducer — that's fine:
  /// nobody else has a reference to it. We return it from the
  /// lambda so `fold` threads it to the next call.
  Map<String, int> countByCategory(List<Transaction> rows) {
    throw UnimplementedError('TODO');
  }
}

// ---------------------------------------------------------------------------
// CatalogGrouper — group-by two ways.
// ---------------------------------------------------------------------------

/// Groups catalog item names by their category. Two implementations
/// of the same behaviour so you can compare the styles.
class CatalogGrouper {
  /// Hand-rolled version — useful for understanding the accumulator
  /// pattern. Builds `Map<category, List<name>>` via fold.
  Map<String, List<String>> namesByCategoryManual(List<CatalogItem> items) {
    // TODO:
    //   items.fold<Map<String, List<String>>>({}, (acc, item) {
    //     (acc[item.category] ??= <String>[]).add(item.name);
    //     return acc;
    //   });
    throw UnimplementedError('TODO');
  }

  /// Stdlib-style version — uses [groupBy] from `package:collection`
  /// and then `map`s the grouped lists into just names. This is
  /// what you'd actually ship.
  Map<String, List<String>> namesByCategoryGroupBy(
    List<CatalogItem> items,
  ) {
    // TODO:
    //   final grouped = groupBy(items, (i) => i.category);
    //   return grouped.map(
    //     (category, xs) =>
    //         MapEntry(category, xs.map((i) => i.name).toList()),
    //   );
    throw UnimplementedError('TODO');
  }
}

// ---------------------------------------------------------------------------
// StatsSummary — the multi-field accumulator record.
//
// This is where Dart's named records shine. In one pass over `xs`
// we build a record whose fields are sum, count, max, min — all at
// once, no extra passes over the data.
// ---------------------------------------------------------------------------

/// One-pass computation of sum/count/max/min using a named record
/// as the accumulator.
class StatsSummary {
  /// Summarise [xs].
  ///
  /// For an empty list, return `(sum: 0, count: 0, max: 0, min: 0)`
  /// — the zero-sentinel record. (A production implementation would
  /// probably use `Stats?` to say "no data"; for this lesson the
  /// sentinel keeps the tests simple.)
  Stats summarise(List<int> xs) {
    // TODO: if xs.isEmpty, return the zero-sentinel.
    // Otherwise, seed the fold with the first element:
    //   xs.skip(1).fold<Stats>(
    //     (sum: xs.first, count: 1, max: xs.first, min: xs.first),
    //     (acc, x) => (
    //       sum: acc.sum + x,
    //       count: acc.count + 1,
    //       max: x > acc.max ? x : acc.max,
    //       min: x < acc.min ? x : acc.min,
    //     ),
    //   );
    throw UnimplementedError('TODO');
  }
}
