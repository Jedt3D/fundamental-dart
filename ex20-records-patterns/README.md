# Lesson 20 — Records and pattern matching

> Dart 3 introduced **records** (anonymous immutable tuples) and
> **patterns** (a little language for destructuring values). Together
> they make branching and data-shaping much more expressive.

## The story

```dart
// Positional record
(int, int) minMax(List<int> xs) => (xs.reduce(min), xs.reduce(max));
final (lo, hi) = minMax([3, 1, 4]);

// Named record
({String name, int age}) p = (name: 'Ada', age: 36);
final (:name, :age) = p;   // destructure by name

// switch expression
String classify(int n) => switch (n) {
      0 => 'zero',
      < 0 => 'negative',
      > 0 && < 10 => 'small',
      _ => 'big',
    };

// if-case for shape checking
if (json case {'type': 'point', 'x': num _, 'y': num _}) { /* ... */ }
```

## Your mission

Finish `lib/ex20_records_patterns.dart`:

1. `countParity(xs)` — named record.
2. `minMax(xs)` — positional record.
3. `classify(n)` — switch expression.
4. `isPointLike(json)` — map pattern with type guards.
5. `sumFirstThree(xs)` — list pattern.
6. `describe(person)` — destructure a named record.
7. `labelOf(tagged)` — switch + record patterns.

## Run the tests

```bash
cd ex20-records-patterns && dart pub get && dart test
```
