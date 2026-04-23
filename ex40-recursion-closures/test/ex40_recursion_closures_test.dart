import 'package:ex40_recursion_closures/ex40_recursion_closures.dart';
import 'package:test/test.dart';

// Helpers to keep the test tree readable.
CategoryNode _leaf(String t) => (title: t, children: const []);
CategoryNode _node(String t, List<CategoryNode> c) =>
    (title: t, children: c);

void main() {
  group('Lesson 40 — basic: recursion', () {
    test('sum of a bare int is itself', () {
      expect(NestedNumberSummer().sum(5), equals(5));
      expect(NestedNumberSummer().sum(0), equals(0));
    });

    test('sum of a flat list is the usual sum', () {
      expect(NestedNumberSummer().sum([1, 2, 3, 4]), equals(10));
    });

    test('sum handles deep nesting', () {
      expect(
        NestedNumberSummer().sum([
          1,
          [2, [3, 4]],
          [[5]],
          6,
        ]),
        equals(21),
      );
    });

    test('sum throws ArgumentError on unexpected shapes', () {
      expect(
        () => NestedNumberSummer().sum('nope'),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('CategoryPaths.paths returns one string per leaf', () {
      final tree = _node('electronics', [
        _node('phones', [_leaf('smartphones')]),
        _node('accessories', [_leaf('cables'), _leaf('chargers')]),
      ]);
      expect(
        CategoryPaths().paths(tree),
        equals([
          'electronics > phones > smartphones',
          'electronics > accessories > cables',
          'electronics > accessories > chargers',
        ]),
      );
    });
  });

  group('Lesson 40 — advanced: closures', () {
    test('makeCounter yields 1, 2, 3 and counters are independent', () {
      final a = makeCounter();
      final b = makeCounter();
      expect(a(), equals(1));
      expect(a(), equals(2));
      expect(b(), equals(1));
      expect(a(), equals(3));
      expect(b(), equals(2));
    });

    test('thresholdGate captures its min value', () {
      final atLeastTen = thresholdGate(10);
      expect(atLeastTen(9), isFalse);
      expect(atLeastTen(10), isTrue);
      expect(atLeastTen(100), isTrue);

      // A different gate has its own closed-over threshold.
      final atLeastZero = thresholdGate(0);
      expect(atLeastZero(-1), isFalse);
      expect(atLeastZero(0), isTrue);
    });

    test('TreeTraversal.collect uses the injected predicate', () {
      final tree = _node('electronics', [
        _node('phones', [_leaf('smartphones'), _leaf('feature-phones')]),
        _node('accessories', [_leaf('cables')]),
      ]);

      // Closure 1: titles that contain 's'.
      final withS = TreeTraversal().collect(
        tree,
        (title) => title.contains('s'),
      );
      expect(
        withS,
        equals([
          'electronics',
          'phones',
          'smartphones',
          'accessories',
          'cables',
        ]),
      );

      // Closure 2: short titles (<= 6 chars). SAME traversal code,
      // different predicate, different result.
      final short = TreeTraversal().collect(
        tree,
        (title) => title.length <= 6,
      );
      expect(short, equals(['phones', 'cables']));
    });
  });
}
