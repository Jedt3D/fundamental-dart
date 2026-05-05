# Lesson 03 — Types and operators

> Numbers in Dart come in two flavours: `int` and `double`. Both inherit
> from `num`. The moment you divide with `/`, you're in double territory.

## The story

```dart
const age1 = 42;       // inferred: int
const age2 = 21;       // inferred: int
const avg  = (age1 + age2) / 2;  // inferred: double, value 31.5
```

Why `double`? Because `/` can produce a fractional result. If you
really want integer division, use `~/`:

```dart
5 ~/ 2   // == 2
5 %  2   // == 1
```

Common comparison operators: `== != < <= > >=`
Common logical operators: `&& || !`

## Your mission

Implement four helpers in `lib/ex03_types_ops.dart`:

1. `average(a, b)` — mean as `double`.
2. `letterGrade(score)` — classic A/B/C/D/F.
3. `sumUpTo(n)` — Gauss' favourite.
4. `isEven(n)` — using `%`.

## Run the tests

```bash
cd ex03-types-ops && dart pub get && dart test
```
