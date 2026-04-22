# Lesson 24 — Binary search tree

> Every node's left subtree is smaller and its right subtree is
> bigger. That invariant makes search an O(log n) affair on balanced
> trees.

## The story

```dart
class _Node<T extends Comparable<T>> {
  _Node(this.value);
  final T value;
  _Node<T>? left, right;
}

class Bst<T extends Comparable<T>> {
  _Node<T>? _root;
  void insert(T v) { /* recurse, pick left or right by compareTo */ }
  bool contains(T v) { /* ditto */ }
  List<T> inOrder() { /* left, self, right */ }
}
```

## Your mission

Finish `lib/ex24_bst.dart`:

1. `insert(v)` — descend by `compareTo`; ignore duplicates.
2. `contains(v)` — symmetric descent.
3. `inOrder()` — classic recursive traversal.
4. Keep `size` in sync.

## Run the tests

```bash
cd ex24-bst && dart pub get && dart test
```
