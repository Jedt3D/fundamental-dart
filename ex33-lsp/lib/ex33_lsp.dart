/// Lesson 33 — Liskov Substitution Principle.
///
/// *Subtypes must be substitutable for their base type without
/// breaking the program.*
///
/// Anti-pattern: `class Penguin extends FlyingBird` — a Penguin can't
/// fly, so `Penguin().fly()` violates the `FlyingBird` contract.
///
/// Fix: split the capabilities into interfaces.

abstract class Bird {
  String get name;
}

/// Anything that can fly implements this interface.
abstract class Flier {
  String fly();
}

/// Anything that can swim implements this interface.
abstract class Swimmer {
  String swim();
}

class Sparrow extends Bird implements Flier {
  Sparrow();
  @override
  String get name => 'sparrow';
  @override
  String fly() {
    throw UnimplementedError("TODO: '<name> flaps away'");
  }
}

class Penguin extends Bird implements Swimmer {
  Penguin();
  @override
  String get name => 'penguin';
  @override
  String swim() {
    throw UnimplementedError("TODO: '<name> dives in'");
  }
}

class Duck extends Bird implements Flier, Swimmer {
  Duck();
  @override
  String get name => 'duck';
  @override
  String fly() {
    throw UnimplementedError("TODO: '<name> flaps away'");
  }
  @override
  String swim() {
    throw UnimplementedError("TODO: '<name> dives in'");
  }
}

/// Helper that only works with [Flier]s. Any `Flier` substitutes
/// cleanly here — that's LSP in action.
String sendOnAerialMission(Flier f) => f.fly();

/// Helper that only works with [Swimmer]s.
String sendOnAquaticMission(Swimmer s) => s.swim();
