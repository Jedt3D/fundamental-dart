# Lesson 06 — Loops

> Repetition is what lets a handful of code do a huge amount of work.

## The story

```dart
// C-style for
for (var i = 1; i <= 5; i++) {
  print(i);
}

// for-in on any Iterable
for (final name in ['Ada', 'Grace']) {
  print(name);
}

// while
var n = 10;
while (n > 0) {
  n--;
}

// break/continue work as you'd expect
```

## Your mission

Implement four functions in `lib/ex06_loops.dart`:

1. `factorial(n)` — classic `for` loop.
2. `sumDigits(n)` — a `while` loop that peels digits off.
3. `firstNSquares(n)` — build up a `List<int>`.
4. `nextPowerOfTwo(n)` — keep doubling until you're ≥ n.

## Run the tests

```bash
cd ex06-loops && dart pub get && dart test
```
