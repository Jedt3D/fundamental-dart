# Lesson 21 — Stack\<T\>

> A stack is LIFO: the last thing you push is the first thing you pop.

## The story

```dart
class Stack<T> {
  final _items = <T>[];
  int get length => _items.length;
  bool get isEmpty => _items.isEmpty;
  void push(T x) => _items.add(x);
  T pop() {
    if (_items.isEmpty) throw StateError('empty');
    return _items.removeLast();
  }
}
```

## Your mission

Implement every member of `Stack<T>` in `lib/ex21_stack.dart`.
`pop()` and `peek()` on an empty stack must throw `StateError`.

## Run the tests

```bash
cd ex21-stack && dart pub get && dart test
```
