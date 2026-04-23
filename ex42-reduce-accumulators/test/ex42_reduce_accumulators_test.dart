import 'package:ex42_reduce_accumulators/ex42_reduce_accumulators.dart';
import 'package:test/test.dart';

const _transactions = <Transaction>[
  (category: 'fruit', amountCents: 150),
  (category: 'bakery', amountCents: 399),
  (category: 'fruit', amountCents: 500),
  (category: 'dairy', amountCents: 250),
  (category: 'bakery', amountCents: 120),
];

const _catalog = <CatalogItem>[
  (name: 'Apple', category: 'fruit'),
  (name: 'Bread', category: 'bakery'),
  (name: 'Cherry', category: 'fruit'),
  (name: 'Milk', category: 'dairy'),
  (name: 'Bagel', category: 'bakery'),
];

void main() {
  group('Lesson 42 — basic: sum, frequency, group-by', () {
    test('RevenueCalculator.totalAmount sums amountCents', () {
      expect(
        RevenueCalculator().totalAmount(_transactions),
        equals(150 + 399 + 500 + 250 + 120),
      );
      expect(RevenueCalculator().totalAmount(const []), equals(0));
    });

    test('FrequencyCounter.countByCategory builds a histogram', () {
      expect(
        FrequencyCounter().countByCategory(_transactions),
        equals({'fruit': 2, 'bakery': 2, 'dairy': 1}),
      );
    });

    test('CatalogGrouper.namesByCategoryManual groups by category', () {
      expect(
        CatalogGrouper().namesByCategoryManual(_catalog),
        equals({
          'fruit': ['Apple', 'Cherry'],
          'bakery': ['Bread', 'Bagel'],
          'dairy': ['Milk'],
        }),
      );
    });
  });

  group('Lesson 42 — advanced: groupBy, multi-field records, consistency', () {
    test('groupBy version yields the same result as the manual one', () {
      final manual = CatalogGrouper().namesByCategoryManual(_catalog);
      final groupBy = CatalogGrouper().namesByCategoryGroupBy(_catalog);
      expect(groupBy, equals(manual));
    });

    test('CatalogGrouper is idempotent — repeat calls give equal maps', () {
      final g = CatalogGrouper();
      final a = g.namesByCategoryManual(_catalog);
      final b = g.namesByCategoryManual(_catalog);
      expect(a, equals(b));
    });

    test('StatsSummary.summarise computes sum/count/max/min in one pass', () {
      final s = StatsSummary().summarise([5, 2, 9, 1, 7]);
      expect(s.sum, equals(24));
      expect(s.count, equals(5));
      expect(s.max, equals(9));
      expect(s.min, equals(1));
    });

    test('StatsSummary.summarise([]) returns the zero-sentinel', () {
      final s = StatsSummary().summarise(const []);
      expect(s, equals((sum: 0, count: 0, max: 0, min: 0)));
    });

    test('aggregators agree on row count across the same dataset', () {
      final freq = FrequencyCounter().countByCategory(_transactions);
      final totalFromFreq = freq.values.fold<int>(0, (a, b) => a + b);
      expect(totalFromFreq, equals(_transactions.length));

      final grouped = CatalogGrouper().namesByCategoryManual(_catalog);
      final totalFromGrouped = grouped.values.fold<int>(0, (a, v) => a + v.length);
      expect(totalFromGrouped, equals(_catalog.length));
    });
  });
}
