/// Lesson 12 — Lists.
///
/// A `List<T>` is an ordered, growable collection. The functional
/// friends you'll use every day are:
///   `.map(f)`     transform each element
///   `.where(f)`   keep the elements that match a test
///   `.fold(init, f)`  reduce to a single value

/// Return a list of the twelve English month names, in order.
List<String> months() {
  throw UnimplementedError('TODO');
}

/// Return a new list where each element of [xs] has been doubled.
/// Use `.map(...).toList()`.
List<int> doubled(List<int> xs) {
  throw UnimplementedError('TODO');
}

/// Return only the even numbers from [xs], preserving order.
/// Use `.where(...).toList()`.
List<int> onlyEvens(List<int> xs) {
  throw UnimplementedError('TODO');
}

/// Return the sum of [xs]. Use `.fold(0, ...)`. Empty list should sum
/// to 0.
int sumList(List<int> xs) {
  throw UnimplementedError('TODO');
}
