# Lesson 30 — Decorator pattern

> Wrap an object to add behaviour without changing its class. Each
> decorator forwards to the inner object and layers its own work on
> top.

## The story

```dart
abstract class Coffee {
  String get description;
  double get cost;
}

class SimpleCoffee implements Coffee {
  @override String get description => 'coffee';
  @override double get cost        => 2.0;
}

abstract class CoffeeDecorator implements Coffee {
  CoffeeDecorator(this.inner);
  final Coffee inner;
}

class Milk extends CoffeeDecorator {
  Milk(Coffee inner) : super(inner);
  @override String get description => '${inner.description} + milk';
  @override double get cost        => inner.cost + 0.5;
}
```

## Your mission

Finish `Milk` and `Sugar` in `lib/ex30_decorator.dart`.

## Run the tests

```bash
cd ex30-decorator && dart pub get && dart test
```
