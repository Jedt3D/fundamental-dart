# Lesson 02 — Naming data

> In Dart you rarely write a type — you write `var`, `final`, or `const`
> and Dart infers the type from the value. Learning when to reach for
> each is the whole game.

## The story

```dart
var   counter   = 0;         // mutable, type inferred as int
final name      = 'Ada';     // run-time constant — set once
const birthYear = 1815;      // compile-time constant
```

- Use `const` when the value is known at compile time.
- Use `final` when the value is only known at runtime but won't change.
- Use `var` (or a plain type) when the variable will be reassigned.

Dart also has a powerful `dart:math` library — you'll use it to prove
that `1 / sqrt(2) == sin(45°)`.

## Your mission

Open `lib/ex02_basic.dart` and implement four functions:

1. `oneOverRootTwo()` — returns `1 / sqrt(2)`.
2. `sinOfFortyFiveDegrees()` — returns `sin(pi / 4)`.
3. `declareMyAge(age)` — returns `age` (practice `const` locally).
4. `averageAge(a, b)` — returns `(a + b) / 2` as a `double`.

## Run the tests

```bash
cd ex02-basic
dart pub get
dart test
```

The doc comments in `lib/ex02_basic.dart` give you all the hints you
need.
