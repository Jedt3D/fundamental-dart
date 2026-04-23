import 'dart:math' as math;

import 'package:ex02_basic/ex02_basic.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 02 — Naming data', () {
    test('oneOverRootTwo returns ~0.7071', () {
      expect(oneOverRootTwo(), closeTo(1 / math.sqrt(2), 1e-12));
    });

    test('sinOfFortyFiveDegrees equals sin(pi/4)', () {
      expect(sinOfFortyFiveDegrees(), closeTo(math.sin(math.pi / 4), 1e-12));
    });

    test('oneOverRootTwo and sinOfFortyFiveDegrees are the same number', () {
      expect(oneOverRootTwo(), closeTo(sinOfFortyFiveDegrees(), 1e-12));
    });

    test('declareMyAge returns the age you pass in', () {
      expect(declareMyAge(30), equals(30));
      expect(declareMyAge(98), equals(98));
    });

    test('averageAge returns the mean as a double', () {
      expect(averageAge(98, 27), equals(62.5));
      expect(averageAge(10, 10), equals(10.0));
      expect(averageAge(1, 2), isA<double>());
    });
  });
}
