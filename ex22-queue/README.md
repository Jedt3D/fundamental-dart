# Lesson 22 — Queue\<T\>

> A queue is FIFO: first in, first out — like the line at a coffee
> shop.

## The story

```dart
class Queue<T> {
  final _items = <T>[];
  void enqueue(T x) => _items.add(x);
  T dequeue() {
    if (_items.isEmpty) throw StateError('empty');
    return _items.removeAt(0);
  }
}
```

## Your mission

Implement every member of `Queue<T>` in `lib/ex22_queue.dart`.

## Run the tests

```bash
cd ex22-queue && dart pub get && dart test
```
