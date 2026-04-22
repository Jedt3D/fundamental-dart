/// Lesson 23 — Singly linked list.
///
/// A linked list is a chain of nodes, each holding a value and a
/// reference to the next. You'll implement enough of it to get the
/// core idea: constant-time prepend, and a classic recursive feel.

class _Node<T> {
  _Node(this.value, [this.next]);
  final T value;
  _Node<T>? next;
}

class LinkedList<T> {
  _Node<T>? _head;
  int _length = 0;

  int get length => throw UnimplementedError('TODO');
  bool get isEmpty => throw UnimplementedError('TODO');

  /// Add [value] to the front. O(1).
  void prepend(T value) {
    throw UnimplementedError('TODO');
  }

  /// Add [value] to the end. O(n).
  void append(T value) {
    throw UnimplementedError('TODO');
  }

  /// Whether [value] appears in the list.
  bool contains(T value) {
    throw UnimplementedError('TODO');
  }

  /// Remove the first occurrence of [value]. Return `true` when
  /// something was removed.
  bool remove(T value) {
    throw UnimplementedError('TODO');
  }

  /// Snapshot of the list in head-to-tail order.
  List<T> toList() {
    throw UnimplementedError('TODO');
  }
}
