import 'package:ex39_sqlite_store/ex39_sqlite_store.dart';
import 'package:test/test.dart';

void main() {
  late ProductStore store;

  setUp(() => store = ProductStore.openInMemory());
  tearDown(() => store.dispose());

  group('Lesson 39 — basic: schema + writes', () {
    test('openInMemory returns a store ready to accept rows', () {
      // Table exists — a SELECT against it should not throw.
      expect(
        () => store.db.select('SELECT * FROM products'),
        returnsNormally,
      );
    });

    test('add inserts a row visible via a raw SELECT COUNT(*)', () {
      store.add(
        sku: 'A-1',
        name: 'Apple',
        priceCents: 150,
        category: 'fruit',
      );
      final rows = store.db.select('SELECT COUNT(*) AS c FROM products');
      expect(rows.first['c'], equals(1));
    });

    test('setupSchema is idempotent', () {
      expect(store.setupSchema, returnsNormally);
      expect(store.setupSchema, returnsNormally);
    });
  });

  group('Lesson 39 — advanced: queries', () {
    setUp(() {
      store
        ..add(sku: 'F-1', name: 'Cherry', priceCents: 500, category: 'fruit')
        ..add(sku: 'F-2', name: 'Apple', priceCents: 150, category: 'fruit')
        ..add(sku: 'B-1', name: 'Bread', priceCents: 399, category: 'bakery');
    });

    test('namesInCategory returns matches sorted alphabetically', () {
      final q = ProductQueries(store.db);
      expect(q.namesInCategory('fruit'), equals(['Apple', 'Cherry']));
      expect(q.namesInCategory('bakery'), equals(['Bread']));
      expect(q.namesInCategory('spices'), isEmpty);
    });

    test('namesInCategory is safe against SQL injection', () {
      final q = ProductQueries(store.db);
      // A naive `"... WHERE category = '$category'"` would treat the
      // OR 1=1 as SQL and leak all rows. With a parameterised query
      // the string is just data.
      final injected = q.namesInCategory("' OR 1=1; --");
      expect(injected, isEmpty);

      // Sanity check: a real category still works.
      expect(q.namesInCategory('fruit'), isNotEmpty);
    });

    test('averagePriceInCategory averages and handles empty gracefully', () {
      final q = ProductQueries(store.db);
      expect(q.averagePriceInCategory('fruit'), closeTo(325, 0.001));
      expect(q.averagePriceInCategory('bakery'), equals(399));
      expect(q.averagePriceInCategory('nope'), equals(0.0));
    });

    test('countByCategory groups per category', () {
      final q = ProductQueries(store.db);
      expect(q.countByCategory(), equals({'fruit': 2, 'bakery': 1}));
    });
  });
}
