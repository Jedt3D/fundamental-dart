/// Lesson 04 — Strings.
///
/// Strings use single quotes in Dart by convention. Interpolate with
/// `$variable` or `${expression}`. Use triple quotes for multi-line
/// strings and `r'...'` for raw strings (no escapes, no interpolation).

/// Concatenate [a] and [b] with a single space between them.
String joinWithSpace(String a, String b) {
  throw UnimplementedError('TODO');
}

/// Return `"My name is <name> and I'm <age>."` using string
/// interpolation.
String introduce(String name, int age) {
  throw UnimplementedError('TODO');
}

/// Return the poem below, including the newline between lines.
///
///   Roses are red,
///   violets are blue.
String twoLinePoem() {
  throw UnimplementedError('TODO: use a multi-line string');
}

/// Return the number of **non-whitespace** characters in [s].
int visibleLetterCount(String s) {
  throw UnimplementedError('TODO: String.replaceAll + .length');
}

/// Return [s] reversed. `'hello'` → `'olleh'`.
String reverse(String s) {
  throw UnimplementedError('TODO: split + reversed + join');
}
