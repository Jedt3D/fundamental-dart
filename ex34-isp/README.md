# Lesson 34 — Interface Segregation Principle (ISP)

> *Clients should not be forced to depend on methods they do not use.*

## The story

A fat `IWorker { work(); eat(); sleep(); }` forces `Robot` to pretend
it eats and sleeps. Split it into tiny role interfaces:

```dart
abstract class Workable { int work(); }
abstract class Eatable  { String eat(); }
abstract class Sleepable{ String sleep(); }

class Human implements Workable, Eatable, Sleepable { ... }
class Robot implements Workable                     { ... }
```

Now `Manager` can ask for `Iterable<Workable>` — no sleeping robots
in sight.

## Your mission

Finish `lib/ex34_isp.dart` and make sure `Manager.totalHours` only
needs `Workable`.

## Run the tests

```bash
cd ex34-isp && dart pub get && dart test
```
