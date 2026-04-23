import 'package:ex15_iterables/ex15_iterables.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 15 — Iterables', () {
    test('HundredSquares yields 100 values', () {
      expect(HundredSquares().length, equals(100));
    });

    test('HundredSquares first five are 1,4,9,16,25', () {
      expect(HundredSquares().take(5).toList(), equals([1, 4, 9, 16, 25]));
    });

    test('firstSquares(n) matches HundredSquares.take(n)', () {
      expect(firstSquares(3), equals([1, 4, 9]));
      expect(firstSquares(0), isEmpty);
    });

    test('sumOfFirstNSquares uses fold', () {
      expect(sumOfFirstNSquares(3), equals(1 + 4 + 9));
      expect(sumOfFirstNSquares(10), equals(385));
    });

    test('containsSquare recognises perfect squares up to 100²', () {
      expect(containsSquare(1), isTrue);
      expect(containsSquare(10000), isTrue);
      expect(containsSquare(2), isFalse);
      expect(containsSquare(10001), isFalse);
    });
  });
}
