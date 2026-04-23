# Lesson 23 — Singly linked list

> Each element is a node that knows only about the next one. `prepend`
> is O(1); `append` and `remove` are O(n). Perfect for learning how
> references thread together.

## The story

```dart
class _Node<T> {
  _Node(this.value, [this.next]);
  final T value;
  _Node<T>? next;
}

class LinkedList<T> {
  _Node<T>? _head;
  void prepend(T v) => _head = _Node(v, _head);
}
```

## Your mission

Fill in the stubs in `lib/ex23_linked_list.dart`:

1. `length` / `isEmpty`.
2. `prepend(v)` — O(1) insert at head.
3. `append(v)` — O(n) walk to the tail.
4. `contains(v)` — linear search.
5. `remove(v)` — remove the **first** occurrence; works at head and middle.
6. `toList()` — snapshot.

## Run the tests

```bash
cd ex23-linked-list && dart pub get && dart test
```
