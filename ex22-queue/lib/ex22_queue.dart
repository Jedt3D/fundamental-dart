/// Lesson 22 — Queue<T>.
///
/// FIFO — "first in, first out". Implement it on top of a `List<T>`
/// (a real-world queue would back this with a doubly-linked list or a
/// ring buffer for O(1) dequeue).

class Queue<T> {
  final List<T> _items = [];

  int get length => throw UnimplementedError('TODO');
  bool get isEmpty => throw UnimplementedError('TODO');

  /// Add [item] to the back.
  void enqueue(T item) {
    throw UnimplementedError('TODO');
  }

  /// Remove and return the front item. Throw [StateError] when empty.
  T dequeue() {
    throw UnimplementedError('TODO');
  }

  /// Return (don't remove) the front item. Throw [StateError] when empty.
  T peek() {
    throw UnimplementedError('TODO');
  }
}
