/// Lesson 24 — Binary search tree (BST).
///
/// Each node holds a value plus a left and right child. For every
/// node, everything on the left is smaller, everything on the right
/// is larger. That invariant is what makes search and insert O(log n)
/// on balanced trees.

class _BstNode<T extends Comparable<T>> {
  _BstNode(this.value);
  final T value;
  _BstNode<T>? left;
  _BstNode<T>? right;
}

class Bst<T extends Comparable<T>> {
  _BstNode<T>? _root;
  int _size = 0;

  int get size => throw UnimplementedError('TODO');
  bool get isEmpty => throw UnimplementedError('TODO');

  /// Insert [value]. Duplicates are ignored.
  void insert(T value) {
    throw UnimplementedError('TODO');
  }

  /// Return whether [value] is in the tree.
  bool contains(T value) {
    throw UnimplementedError('TODO');
  }

  /// In-order traversal yields values in sorted order.
  List<T> inOrder() {
    throw UnimplementedError('TODO');
  }
}
