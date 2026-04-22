/// Lesson 21 — Stack<T>.
///
/// LIFO — "last in, first out". Backed by a `List<T>` internally.

class Stack<T> {
  final List<T> _items = [];

  int get length => throw UnimplementedError('TODO');

  bool get isEmpty => throw UnimplementedError('TODO');

  /// Put [item] on top.
  void push(T item) {
    throw UnimplementedError('TODO');
  }

  /// Remove and return the top item. Throw [StateError] when empty.
  T pop() {
    throw UnimplementedError('TODO');
  }

  /// Return (don't remove) the top item. Throw [StateError] when empty.
  T peek() {
    throw UnimplementedError('TODO');
  }
}
