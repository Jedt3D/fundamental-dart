# Lesson 04 — Strings

> Strings are just sequences of characters, but Dart gives you three
> comfy ways to build them.

## The story

```dart
const name = 'Ada';
const age  = 36;

// 1. Concatenation
final a = 'Hello ' + name;

// 2. Interpolation (preferred)
final b = 'Hello $name, you are $age';
final c = 'Next year: ${age + 1}';

// 3. Triple-quoted multiline
final poem = '''
Roses are red,
violets are blue.
''';
```

Useful helpers: `.toUpperCase()`, `.toLowerCase()`, `.contains()`,
`.split()`, `.replaceAll()`, `.length`.

## Your mission

Implement five functions in `lib/ex04_strings.dart`:

1. `joinWithSpace(a, b)` — concatenation practice.
2. `introduce(name, age)` — string interpolation.
3. `twoLinePoem()` — a multi-line literal.
4. `visibleLetterCount(s)` — ignore whitespace.
5. `reverse(s)` — split → reverse → join.

## Run the tests

```bash
cd ex04-strings && dart pub get && dart test
```
