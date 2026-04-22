import 'package:ex06_loops/ex06_loops.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 06 — Loops', () {
    test('factorial of small numbers', () {
      expect(factorial(0), equals(1));
      expect(factorial(1), equals(1));
      expect(factorial(5), equals(120));
      expect(factorial(10), equals(3628800));
    });

    test('sumDigits adds decimal digits', () {
      expect(sumDigits(0), equals(0));
      expect(sumDigits(9), equals(9));
      expect(sumDigits(1729), equals(19));
      expect(sumDigits(99999), equals(45));
    });

    test('firstNSquares builds a list of squares', () {
      expect(firstNSquares(0), isEmpty);
      expect(firstNSquares(1), equals([1]));
      expect(firstNSquares(5), equals([1, 4, 9, 16, 25]));
    });

    test('nextPowerOfTwo rounds up to the nearest power of two', () {
      expect(nextPowerOfTwo(1), equals(1));
      expect(nextPowerOfTwo(2), equals(2));
      expect(nextPowerOfTwo(5), equals(8));
      expect(nextPowerOfTwo(16), equals(16));
      expect(nextPowerOfTwo(17), equals(32));
    });
  });
}
