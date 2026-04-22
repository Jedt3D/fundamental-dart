/// Lesson 20 — Records and pattern matching (Dart 3).
///
/// Records are anonymous, immutable value tuples. Pattern matching
/// works in `switch` (statement and expression), `if-case`, and
/// destructuring assignments.

/// Return a record with the count of evens and odds in [xs].
({int evens, int odds}) countParity(List<int> xs) {
  throw UnimplementedError('TODO: return (evens: ..., odds: ...)');
}

/// Return the positional record `(min, max)` for [xs]. Assumes
/// [xs] is non-empty.
(int min, int max) minMax(List<int> xs) {
  throw UnimplementedError('TODO');
}

/// Classify [n] using a *switch expression*:
///   n == 0          -> 'zero'
///   n < 0           -> 'negative'
///   n > 0 && n < 10 -> 'small'
///   else            -> 'big'
String classify(int n) {
  throw UnimplementedError('TODO: switch (n) { case 0 => ... }');
}

/// Return `true` when [json] looks like `{'type': 'point', 'x': <num>, 'y': <num>}`.
/// Use an `if-case` with a Map pattern.
bool isPointLike(Object? json) {
  throw UnimplementedError('TODO');
}

/// Return the sum of the first three elements of [xs] using a list
/// pattern. Throw `ArgumentError` if the list has fewer than 3 items.
int sumFirstThree(List<int> xs) {
  throw UnimplementedError('TODO: if (xs case [var a, var b, var c, ...])');
}

/// Destructure the record with fields `name` and `age`:
/// return the sentence "`<name> is <age>`".
///
/// Example: `describe((name: 'Ada', age: 36)) == 'Ada is 36'`.
String describe(({String name, int age}) person) {
  throw UnimplementedError('TODO: final (:name, :age) = person;');
}

/// Given a record whose first field is a tag, return a nice label.
/// Use a switch expression with record patterns.
///
/// ('ok', int _)    -> 'OK with code <code>'
/// ('error', String msg) -> 'error: <msg>'
/// anything else    -> 'unknown'
String labelOf((String, Object?) tagged) {
  throw UnimplementedError('TODO: switch with record patterns');
}
