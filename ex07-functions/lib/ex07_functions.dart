/// Lesson 07 — Functions.
///
/// Dart functions can have:
///   - required positional params:   `f(int a, int b)`
///   - optional positional params:   `f(int a, [int b = 0])`
///   - named params:                 `f({required int a, int b = 0})`
/// Arrow syntax `=> expr` is shorthand for `{ return expr; }`.
/// Functions are first-class — you can return and store them.

/// Return `"You're wonderful, <name>. <numberPeople> people think so."`.
/// [numberPeople] is a named parameter that defaults to 1.
String youAreWonderful(String name, {int numberPeople = 1}) {
  throw UnimplementedError('TODO');
}

/// Sum up to four integers. Only [a] and [b] are required — [c] and
/// [d] are optional positional with a default of 0.
int addUp(int a, int b, [int c = 0, int d = 0]) {
  throw UnimplementedError('TODO');
}

/// Return `n * n` using arrow syntax in your implementation.
int square(int n) => throw UnimplementedError('TODO');

/// Return a *new* counter function. Each call to the returned function
/// yields the next integer starting at 1.
///
/// Example:
///   final next = makeCounter();
///   next() == 1;
///   next() == 2;
///   next() == 3;
int Function() makeCounter() {
  throw UnimplementedError('TODO: return a closure over a local int');
}
