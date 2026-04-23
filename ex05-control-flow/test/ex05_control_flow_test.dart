import 'package:ex05_control_flow/ex05_control_flow.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 05 — Control flow', () {
    test('fizzbuzz handles all four cases', () {
      expect(fizzbuzz(1), equals('1'));
      expect(fizzbuzz(3), equals('Fizz'));
      expect(fizzbuzz(5), equals('Buzz'));
      expect(fizzbuzz(15), equals('FizzBuzz'));
      expect(fizzbuzz(30), equals('FizzBuzz'));
      expect(fizzbuzz(7), equals('7'));
    });

    test('isTeenager covers the 13..19 range', () {
      expect(isTeenager(12), isFalse);
      expect(isTeenager(13), isTrue);
      expect(isTeenager(19), isTrue);
      expect(isTeenager(20), isFalse);
    });

    test('classify uses switch', () {
      expect(classify('rock'), equals('heavy'));
      expect(classify('paper'), equals('flimsy'));
      expect(classify('scissors'), equals('sharp'));
      expect(classify('lizard'), equals('unknown'));
    });

    test('absDiff returns the absolute difference', () {
      expect(absDiff(10, 3), equals(7));
      expect(absDiff(3, 10), equals(7));
      expect(absDiff(-5, 5), equals(10));
    });
  });
}
