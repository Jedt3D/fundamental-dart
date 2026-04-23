import 'package:ex19_generics/ex19_generics.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 19 — Generics and typedefs', () {
    test('Pair stores two values of different types', () {
      final p = Pair<String, int>('Ada', 36);
      expect(p.first, equals('Ada'));
      expect(p.second, equals(36));
    });

    test('Pair.swap flips the types and values', () {
      final p = Pair<String, int>('Ada', 36);
      final s = p.swap();
      expect(s, isA<Pair<int, String>>());
      expect(s.first, equals(36));
      expect(s.second, equals('Ada'));
    });

    test('identityOf preserves type', () {
      expect(identityOf<int>(42), equals(42));
      expect(identityOf<String>('hi'), equals('hi'));
    });

    test('firstOrNull returns null for empty lists', () {
      expect(firstOrNull<int>([]), isNull);
      expect(firstOrNull<int>([1, 2, 3]), equals(1));
    });

    test('mapAll transforms each element', () {
      expect(mapAll<int, int>([1, 2, 3], (x) => x * x), equals([1, 4, 9]));
      expect(
        mapAll<String, int>(['a', 'bb', 'ccc'], (s) => s.length),
        equals([1, 2, 3]),
      );
    });

    test('sumNums works for ints and doubles via the bound', () {
      expect(sumNums<int>([1, 2, 3]), equals(6));
      expect(sumNums<double>([0.5, 0.5, 1.0]), equals(2.0));
    });

    test('combine applies the typedef-ed function', () {
      expect(combine(3, 4, (a, b) => a + b), equals(7));
      expect(combine(6, 2, (a, b) => a - b), equals(4));
    });

    test('adder() returns an IntBinaryOp that sums', () {
      final add = adder();
      expect(add, isA<IntBinaryOp>());
      expect(add(2, 3), equals(5));
    });
  });
}
