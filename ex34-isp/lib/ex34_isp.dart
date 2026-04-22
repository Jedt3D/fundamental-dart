/// Lesson 34 — Interface Segregation Principle.
///
/// *Clients should not be forced to depend on interfaces they do not
/// use.*
///
/// Anti-pattern: one fat `IWorker` interface that forces `Robot` to
/// implement `eat()` and `sleep()`.
///
/// Fix: split into tiny role interfaces. Each class only implements
/// what it actually does.

abstract class Workable {
  int work();
}

abstract class Eatable {
  String eat();
}

abstract class Sleepable {
  String sleep();
}

/// Humans do all three.
class Human implements Workable, Eatable, Sleepable {
  @override
  int work() {
    throw UnimplementedError('TODO: return 8 (hours)');
  }
  @override
  String eat() {
    throw UnimplementedError("TODO: 'yum'");
  }
  @override
  String sleep() {
    throw UnimplementedError("TODO: 'zzz'");
  }
}

/// Robots only work.
class Robot implements Workable {
  @override
  int work() {
    throw UnimplementedError('TODO: return 24');
  }
}

/// A manager tracks total hours worked. It only depends on [Workable]
/// — not on the whole fat interface.
class Manager {
  int totalHours(Iterable<Workable> workers) {
    throw UnimplementedError('TODO: fold work() hours');
  }
}
