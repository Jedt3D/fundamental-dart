# Lesson 28 — Observer pattern

> "When I change, tell everyone who cares." The subject keeps a list
> of observers and notifies them.

## The story

```dart
typedef Observer<T> = void Function(T event);

class Subject<T> {
  final _observers = <Observer<T>>[];
  void subscribe(Observer<T> o)   => _observers.add(o);
  void unsubscribe(Observer<T> o) => _observers.remove(o);
  void notify(T event) {
    for (final o in _observers) { o(event); }
  }
}
```

Dart ships `Stream`/`StreamController` that serve the same role —
reach for them in real apps. This lesson shows the raw mechanics.

## Your mission

Finish `lib/ex28_observer.dart`:

1. `subscribe(o)` — register an observer.
2. `unsubscribe(o)` — no-op when not registered.
3. `notify(e)` — call every observer in registration order.

## Run the tests

```bash
cd ex28-observer && dart pub get && dart test
```
