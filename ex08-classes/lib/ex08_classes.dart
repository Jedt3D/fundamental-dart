/// Lesson 08 — Classes.
///
/// Dart classes are declared with `class`. Fields default to public;
/// prefix with `_` to make them library-private. Getters and setters
/// let you expose "computed properties" without parentheses.

/// A rectangle with non-negative sides.
///
///   final r = Rectangle()
///     ..width = 3
///     ..height = 4;
///   r.area == 12;
///
/// Negative sides should be *silently clamped* to 0 in the setter.
class Rectangle {
  double _width = 0;
  double _height = 0;

  double get width => throw UnimplementedError('TODO');
  set width(double value) => throw UnimplementedError('TODO');

  double get height => throw UnimplementedError('TODO');
  set height(double value) => throw UnimplementedError('TODO');

  /// Computed property.
  double get area => throw UnimplementedError('TODO');
}

/// A circle with a radius. `area` uses `pi * r^2` — use `dart:math`'s
/// `pi`.
class Circle {
  final double radius;
  Circle(this.radius);

  double get area => throw UnimplementedError('TODO');
}

/// A minimal [Shape] hierarchy. [Shape.area] returns 0 by default.
/// [Square.area] must return `side * side`.
class Shape {
  double area() => 0;
}

class Square extends Shape {
  final double side;
  Square(this.side);

  @override
  double area() => throw UnimplementedError('TODO');
}
