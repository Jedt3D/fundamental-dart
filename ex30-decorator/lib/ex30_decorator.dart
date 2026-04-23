/// Lesson 30 — Decorator pattern.
///
/// Wrap an object to add behaviour without changing its class. The
/// canonical example: coffee with optional milk and sugar.

abstract class Coffee {
  String get description;
  double get cost;
}

class SimpleCoffee implements Coffee {
  @override
  String get description => 'coffee';
  @override
  double get cost => 2.0;
}

/// Base decorator holds an inner [Coffee].
abstract class CoffeeDecorator implements Coffee {
  CoffeeDecorator(this.inner);
  final Coffee inner;
}

class Milk extends CoffeeDecorator {
  Milk(Coffee inner) : super(inner);

  @override
  String get description {
    throw UnimplementedError("TODO: '<inner> + milk'");
  }

  @override
  double get cost {
    throw UnimplementedError('TODO: inner.cost + 0.5');
  }
}

class Sugar extends CoffeeDecorator {
  Sugar(Coffee inner) : super(inner);

  @override
  String get description {
    throw UnimplementedError("TODO: '<inner> + sugar'");
  }

  @override
  double get cost {
    throw UnimplementedError('TODO: inner.cost + 0.25');
  }
}
