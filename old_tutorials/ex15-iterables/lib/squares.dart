/// Lesson 15 — Custom iterables.
///
/// Dart's `Iterable<T>` and `Iterator<T>` lets you build your own
/// "sequence" types that work seamlessly in `for-in` loops and with
/// the full `.map`/`.where`/`.take`/`.fold` family.
///
/// Your job: build `HundredSquares`, an iterable over 1², 2², …, 100².

class HundredSquares extends Iterable<int> {
  @override
  Iterator<int> get iterator => SquaredIterator();
}

class SquaredIterator implements Iterator<int> {
  int _index = 0;

  @override
  bool moveNext() {
    // TODO: advance to the next square; return false once we pass 100.
    throw UnimplementedError('TODO');
  }

  @override
  int get current {
    // TODO: return the current index squared.
    throw UnimplementedError('TODO');
  }
}
