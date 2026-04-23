import 'package:ex38_csv_pipeline/ex38_csv_pipeline.dart';
import 'package:test/test.dart';

const _sampleCsv = '''
sku,name,price_cents,category
A-1,Apple,150,fruit
B-2,Bread,399,bakery
C-3,Cherry,500,fruit
''';

void main() {
  group('Lesson 38 — basic: reader + writer round-trip', () {
    test('parse reads header + three rows', () {
      final rows = InventoryCsvReader().parse(_sampleCsv);
      expect(rows.length, equals(3));
      expect(
        rows[0],
        equals((sku: 'A-1', name: 'Apple', priceCents: 150, category: 'fruit')),
      );
      expect(
        rows[2],
        equals((
          sku: 'C-3',
          name: 'Cherry',
          priceCents: 500,
          category: 'fruit',
        )),
      );
    });

    test('parse of header-only / empty input returns []', () {
      expect(InventoryCsvReader().parse(''), isEmpty);
      expect(
        InventoryCsvReader().parse('sku,name,price_cents,category\n'),
        isEmpty,
      );
    });

    test('toCsv writes headers first, rows after, in field order', () {
      final csv = InventoryCsvWriter().toCsv([
        (sku: 'A-1', name: 'Apple', priceCents: 150, category: 'fruit'),
      ]);
      final lines = csv.trim().split('\n');
      expect(lines.first, equals('sku,name,price_cents,category'));
      expect(lines[1], equals('A-1,Apple,150,fruit'));
    });

    test('round-trip: parse(toCsv(rows)) == rows', () {
      final original = InventoryCsvReader().parse(_sampleCsv);
      final written = InventoryCsvWriter().toCsv(original);
      final roundTripped = InventoryCsvReader().parse(written);
      expect(roundTripped, equals(original));
    });
  });

  group('Lesson 38 — advanced: queries + dependency injection', () {
    test('skusInCategory filters preserving order', () {
      final q = InventoryQueries(InventoryCsvReader(), _sampleCsv);
      expect(q.skusInCategory('fruit'), equals(['A-1', 'C-3']));
      expect(q.skusInCategory('bakery'), equals(['B-2']));
      expect(q.skusInCategory('spices'), isEmpty);
    });

    test('totalValueCents sums priceCents across every row', () {
      final q = InventoryQueries(InventoryCsvReader(), _sampleCsv);
      expect(q.totalValueCents(), equals(150 + 399 + 500));
    });

    test('countByCategory groups and counts', () {
      final q = InventoryQueries(InventoryCsvReader(), _sampleCsv);
      expect(q.countByCategory(), equals({'fruit': 2, 'bakery': 1}));
    });

    test('InventoryQueries delegates parsing to the injected reader', () {
      final fake = _FakeReader();
      InventoryQueries(fake, _sampleCsv);
      expect(fake.calls, equals(1));
    });
  });
}

// A tiny fake — the whole point of injection. Replaces the real
// parser with a stub that just records that it was called.
class _FakeReader implements InventoryCsvReader {
  int calls = 0;

  @override
  List<InventoryRow> parse(String csv) {
    calls++;
    return const [];
  }
}
