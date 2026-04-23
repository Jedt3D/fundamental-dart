/// Lesson 27 — Factory method pattern.
///
/// A factory method returns an instance of the "best fit" subclass for
/// the inputs. The caller doesn't need to know which concrete class
/// they're getting — only the interface.

import 'dart:math' as math;

abstract class Shape {
  double area();

  /// Factory that picks a concrete [Shape] by [kind].
  ///
  ///   kind='circle',    sides=[r]    -> Circle
  ///   kind='square',    sides=[s]    -> Square
  ///   kind='rectangle', sides=[w, h] -> Rectangle
  ///   otherwise -> throw ArgumentError
  factory Shape.create(String kind, List<double> sides) {
    throw UnimplementedError('TODO');
  }
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

class Rectangle implements Shape {
  Rectangle(this.width, this.height);
  final double width;
  final double height;
  @override
  double area() => width * height;
}
