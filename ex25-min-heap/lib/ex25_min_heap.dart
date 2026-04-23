/// Lesson 25 — Min-heap.
///
/// A min-heap is a binary heap where the smallest element is always at
/// index 0. Standard array trick: for element at index `i`,
/// parent = (i-1) ~/ 2, left = 2i+1, right = 2i+2.
/// `push` is O(log n), `pop` is O(log n).
///
/// The type parameter must be `Comparable<T>` — that's how we compare
/// nodes.

class MinHeap<T extends Comparable<T>> {
  final List<T> _data = [];

  int get length => throw UnimplementedError('TODO');
  bool get isEmpty => throw UnimplementedError('TODO');

  /// Insert [value] and sift it up to the correct position.
  void push(T value) {
    throw UnimplementedError('TODO');
  }

  /// Return (don't remove) the minimum. Throw [StateError] when empty.
  T peek() {
    throw UnimplementedError('TODO');
  }

  /// Remove and return the minimum. Throw [StateError] when empty.
  /// After removal, sift the replacement down.
  T pop() {
    throw UnimplementedError('TODO');
  }
}
