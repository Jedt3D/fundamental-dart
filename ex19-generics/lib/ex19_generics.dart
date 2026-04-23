/// Lesson 19 — Generics and typedefs.
///
/// Generics let you write code that works with any type while keeping
/// type information. `typedef` gives a name to a type — especially
/// useful for function signatures.

/// A tiny generic pair of values.
class Pair<A, B> {
  final A first;
  final B second;
  Pair(this.first, this.second);

  /// Return a new pair with first and second swapped.
  Pair<B, A> swap() {
    throw UnimplementedError('TODO');
  }
}

/// Return [x] unchanged. The type parameter proves Dart remembers
/// the type.
T identityOf<T>(T x) {
  throw UnimplementedError('TODO');
}

/// Return the first element of [xs], or `null` if it's empty.
T? firstOrNull<T>(List<T> xs) {
  throw UnimplementedError('TODO');
}

/// Map every element of [xs] through [f]. Same as `xs.map(f).toList()`.
List<R> mapAll<T, R>(List<T> xs, R Function(T) f) {
  throw UnimplementedError('TODO');
}

/// Sum a list whose element type must be a `num` subtype.
/// Demonstrates generic *bounds* with `extends`.
T sumNums<T extends num>(List<T> xs) {
  throw UnimplementedError('TODO');
}

// typedef gives the function-signature `int Function(int, int)` a name.
typedef IntBinaryOp = int Function(int a, int b);

/// Apply [op] to [a] and [b]. Demonstrates that typedefs are just
/// aliases — you can pass any matching function.
int combine(int a, int b, IntBinaryOp op) {
  throw UnimplementedError('TODO');
}

/// Return a new `IntBinaryOp` that adds its two arguments.
IntBinaryOp adder() {
  throw UnimplementedError('TODO: return a function that adds');
}
