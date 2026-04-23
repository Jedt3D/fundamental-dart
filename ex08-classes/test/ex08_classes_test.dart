import 'dart:math' as math;

import 'package:ex08_classes/ex08_classes.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 08 — Classes', () {
    test('Rectangle stores width and height', () {
      final r = Rectangle()
        ..width = 3
        ..height = 4;
      expect(r.width, equals(3));
      expect(r.height, equals(4));
    });

    test('Rectangle.area is width * height', () {
      final r = Rectangle()
        ..width = 2.5
        ..height = 4;
      expect(r.area, equals(10));
    });

    test('Rectangle setter clamps negative values to 0', () {
      final r = Rectangle()
        ..width = -5
        ..height = -2;
      expect(r.width, equals(0));
      expect(r.height, equals(0));
      expect(r.area, equals(0));
    });

    test('Circle.area uses pi * r^2', () {
      expect(Circle(1).area, closeTo(math.pi, 1e-12));
      expect(Circle(2).area, closeTo(math.pi * 4, 1e-12));
    });

    test('Square overrides Shape.area()', () {
      final Shape s = Square(5);
      expect(s.area(), equals(25));
      expect(Shape().area(), equals(0));
    });
  });
}
