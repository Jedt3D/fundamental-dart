import 'package:ex03_types_ops/ex03_types_ops.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 03 — Types and operators', () {
    test('average of two ints is a double', () {
      expect(average(42, 21), equals(31.5));
      expect(average(10, 10), isA<double>());
    });

    test('letterGrade maps scores to A..F', () {
      expect(letterGrade(99), equals('A'));
      expect(letterGrade(85), equals('B'));
      expect(letterGrade(72), equals('C'));
      expect(letterGrade(60), equals('D'));
      expect(letterGrade(10), equals('F'));
    });

    test('sumUpTo computes 1 + 2 + ... + n', () {
      expect(sumUpTo(1), equals(1));
      expect(sumUpTo(10), equals(55));
      expect(sumUpTo(100), equals(5050));
    });

    test('isEven tells even from odd', () {
      expect(isEven(0), isTrue);
      expect(isEven(2), isTrue);
      expect(isEven(3), isFalse);
      expect(isEven(-4), isTrue);
    });
  });
}
