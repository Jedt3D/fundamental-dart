import 'dart:math' as math;

import 'package:ex32_ocp/ex32_ocp.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 32 — OCP', () {
    test('AreaCalculator handles circles and squares', () {
      final total = AreaCalculator().totalArea([
        Circle(1),
        Square(2),
      ]);
      expect(total, closeTo(math.pi + 4, 1e-9));
    });

    test('extending with a new Triangle does not modify the calculator', () {
      final total = AreaCalculator().totalArea([
        Triangle(10, 4),   // 20
        Square(3),         // 9
      ]);
      expect(total, equals(29));
    });

    test('empty list is 0', () {
      expect(AreaCalculator().totalArea(const []), equals(0));
    });
  });
}
