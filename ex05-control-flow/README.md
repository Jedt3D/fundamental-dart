# Lesson 05 — Control flow

> Code that always runs the same way isn't very useful. Decisions are
> what make a program interesting.

## The story

```dart
if (age >= 18) {
  print('adult');
} else if (age >= 13) {
  print('teenager');
} else {
  print('kid');
}

final label = (n % 2 == 0) ? 'even' : 'odd';   // ternary

switch (shape) {
  case 'circle':   return pi * r * r;
  case 'square':   return s * s;
  default:         return 0;
}
```

## Your mission

Implement four functions in `lib/ex05_control_flow.dart`:

1. `fizzbuzz(n)` — the classic interview question.
2. `isTeenager(age)` — range checking.
3. `classify(item)` — a `switch` statement.
4. `absDiff(a, b)` — using `?:`.

## Run the tests

```bash
cd ex05-control-flow && dart pub get && dart test
```
