# Lesson 32 — Open/Closed Principle (OCP)

> *Open for extension, closed for modification.* Add new behaviours
> by adding new code, not by editing existing code.

## The story

If `AreaCalculator` knew about every `Shape` subtype:

```dart
double totalArea(List<Shape> shapes) {
  var sum = 0.0;
  for (final s in shapes) {
    if (s is Circle) sum += math.pi * s.radius * s.radius;
    else if (s is Square) sum += s.side * s.side;
    // adding Triangle requires editing here 😢
  }
  return sum;
}
```

…adding a new shape means **modifying** the calculator. Instead, push
`area()` onto the `Shape` interface. New shapes simply implement it.

## Your mission

Implement `AreaCalculator.totalArea` in `lib/ex32_ocp.dart`. Notice
you never have to name concrete shape types — that's the whole point.

## Run the tests

```bash
cd ex32-ocp && dart pub get && dart test
```
