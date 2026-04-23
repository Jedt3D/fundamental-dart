# Lesson 26 — Singleton pattern

> One class, one instance, one global point of access.

## The story

```dart
class Logger {
  Logger._internal();

  static final Logger _instance = Logger._internal();

  factory Logger() => _instance;

  final _entries = <String>[];
  List<String> get entries => List.unmodifiable(_entries);
  void log(String m) => _entries.add(m);
}

identical(Logger(), Logger());   // true
```

> Singletons can hide dependencies and hurt testability. Prefer
> dependency injection where possible — but when a single shared
> instance really is the domain model (logger, cache, bus), this
> pattern is your friend.

## Your mission

Make every test in `test/ex26_singleton_test.dart` pass:

1. Two `Logger()` calls return the same instance.
2. `.log()` appends.
3. `.reset()` clears.
4. `.entries` is unmodifiable.

## Run the tests

```bash
cd ex26-singleton && dart pub get && dart test
```
