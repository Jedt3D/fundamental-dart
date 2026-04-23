/// Lesson 02 — Naming and storing data.
///
/// Dart lets you name data with `var`, `final`, and `const`.
///   - `var`   : value can change later
///   - `final` : set once at runtime, then frozen
///   - `const` : set at compile time and deeply immutable
///
/// Implement the functions below.

import 'dart:math' as math;

/// Return `1 / sqrt(2)` using `dart:math`.
///
/// This should equal `sin(45°)` — the test proves it.
double oneOverRootTwo() {
  throw UnimplementedError('TODO');
}

/// Return `sin(45°)` in **radians** using `dart:math`.
/// Remember: `45° == 45 * pi / 180`.
double sinOfFortyFiveDegrees() {
  throw UnimplementedError('TODO');
}

/// Return [age] unchanged. The test will check that you used
/// `const`/`final` correctly when implementing this.
int declareMyAge(int age) {
  throw UnimplementedError('TODO');
}

/// Return the arithmetic mean of [age1] and [age2] as a `double`.
double averageAge(int age1, int age2) {
  throw UnimplementedError('TODO');
}
