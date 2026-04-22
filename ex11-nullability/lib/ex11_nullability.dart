/// Lesson 11 — Nullability.
///
/// Dart is null-safe. A type like `String` can **never** be null; if
/// you want the possibility of null, use `String?`.
///
/// Key operators:
///   `??`  — "if the left side is null, use the right"
///   `?.`  — "only call if not null, else yield null"
///   `!`   — "trust me, this really isn't null"  (throws if it is)

/// Return `null` when [unknown] is `true`, otherwise the string `'chef'`.
String? findProfession({required bool unknown}) {
  throw UnimplementedError('TODO');
}

/// Return a sentence. If [profession] is null, fall back to `'mystery'`
/// using `??`.
///
/// Example:
///   describe(null)       == 'You are a mystery.'
///   describe('pilot')    == 'You are a pilot.'
String describe(String? profession) {
  throw UnimplementedError('TODO');
}

/// Try to parse [source] as an `int`. Return `null` on failure.
/// Hint: `int.tryParse`.
int? parseAge(String source) {
  throw UnimplementedError('TODO');
}

/// Return the upper-cased string, or the empty string when [s] is null.
/// Use a single expression with `?.` and `??`.
String upperOrEmpty(String? s) {
  throw UnimplementedError('TODO');
}
