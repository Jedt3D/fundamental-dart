import 'dart:math' as math;

import 'package:ex27_factory/ex27_factory.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 27 — Factory method', () {
    test('create("circle", [r]) returns a Circle', () {
      final s = Shape.create('circle', [2]);
      expect(s, isA<Circle>());
      expect(s.area(), closeTo(math.pi * 4, 1e-12));
    });

    test('create("square", [s]) returns a Square', () {
      final s = Shape.create('square', [3]);
      expect(s, isA<Square>());
      expect(s.area(), equals(9));
    });

    test('create("rectangle", [w, h]) returns a Rectangle', () {
      final s = Shape.create('rectangle', [3, 4]);
      expect(s, isA<Rectangle>());
      expect(s.area(), equals(12));
    });

    test('unknown kind throws ArgumentError', () {
      expect(
        () => Shape.create('trapezoid', [1, 2, 3]),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
