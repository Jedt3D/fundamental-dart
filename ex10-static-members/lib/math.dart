/// Lesson 10 — Static members.
///
/// `static` members belong to the **class itself**, not to any instance.
/// They're perfect for constants, counters, and small utility helpers
/// like this one.

class MathUtils {
  MathUtils._();   // private constructor — no instances allowed

  /// Compile-time constant exposed on the class.
  static const double pi = 3.14159265358979323846;

  /// Return the larger of [a] and [b]. Use the ternary `?:`.
  static num biggest(num a, num b) {
    throw UnimplementedError('TODO');
  }

  /// Return the smaller of [a] and [b].
  static num smallest(num a, num b) {
    throw UnimplementedError('TODO');
  }
}
