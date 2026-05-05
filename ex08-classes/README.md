# Lesson 08 — Classes

> Objects bundle data with the operations that act on that data. Dart
> classes give you getters, setters, inheritance, and the handy `..`
> cascade operator for fluent initialisation.

## The story

```dart
class Rectangle {
  double _width  = 0;
  double _height = 0;

  double get width => _width;
  set width(double v) { if (v >= 0) _width = v; }

  double get height => _height;
  set height(double v) { if (v >= 0) _height = v; }

  double get area => _width * _height;   // computed property
}

final r = Rectangle()
  ..width = 3
  ..height = 4;
print(r.area);   // 12
```

`extends` gives you single inheritance:

```dart
class Shape {
  double area() => 0;
}

class Square extends Shape {
  final double side;
  Square(this.side);

  @override
  double area() => side * side;
}
```

## Your mission

Finish the classes in `lib/ex08_classes.dart`:

1. `Rectangle` — getters/setters that clamp negatives to 0.
2. `Circle` — computed `area` using `pi * r * r`.
3. `Square extends Shape` — override `area()`.

## Run the tests

```bash
cd ex08-classes && dart pub get && dart test
```
