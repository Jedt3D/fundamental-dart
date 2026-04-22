# Lesson 27 — Factory method pattern

> "Given these inputs, hand me the right concrete type." The caller
> just depends on the abstract `Shape`.

## The story

```dart
abstract class Shape {
  double area();
  factory Shape.create(String kind, List<double> sides) {
    switch (kind) {
      case 'circle':    return Circle(sides[0]);
      case 'square':    return Square(sides[0]);
      case 'rectangle': return Rectangle(sides[0], sides[1]);
      default:          throw ArgumentError('unknown kind: $kind');
    }
  }
}
```

Compare with plain constructors: the factory lets the class decide
what kind of object to return based on input, without exposing the
concrete classes as construction options.

## Your mission

Implement the `Shape.create` factory in `lib/ex27_factory.dart`.

## Run the tests

```bash
cd ex27-factory && dart pub get && dart test
```
