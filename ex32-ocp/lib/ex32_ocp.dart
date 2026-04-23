/// Lesson 32 — Open/Closed Principle.
///
/// *Software entities should be open for extension, but closed for
/// modification.* You can add new shapes without changing the
/// `AreaCalculator` code.
///
/// Anti-pattern:
///   if (shape is Circle)    ... else if (shape is Square) ... // 🤮
/// Fix:
///   every [Shape] supplies its own `area()` — no dispatch needed.

import 'dart:math' as math;

abstract class Shape {
  double area();
}

class Circle implements Shape {
  Circle(this.radius);
  final double radius;
  @override
  double area() => math.pi * radius * radius;
}

class Square implements Shape {
  Square(this.side);
  final double side;
  @override
  double area() => side * side;
}

/// Sum up the areas of every shape — closed for modification.
class AreaCalculator {
  double totalArea(Iterable<Shape> shapes) {
    throw UnimplementedError('TODO: call shape.area() on each, fold them');
  }
}

/// Adding a new shape: done here, without touching the classes above.
class Triangle implements Shape {
  Triangle(this.base, this.height);
  final double base;
  final double height;
  @override
  double area() => 0.5 * base * height;
}
