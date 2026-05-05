# Lesson 10 — Static members

> A `static` member lives on the *class*, not on any single instance.
> Think of it as a namespaced global with a nicer address.

## The story

```dart
class MathUtils {
  MathUtils._();   // no instances, please

  static const double pi = 3.14159265358979;
  static num biggest(num a, num b)  => (a > b) ? a : b;
  static num smallest(num a, num b) => (a < b) ? a : b;
}

MathUtils.pi;              // OK
MathUtils.biggest(3, 7);   // 7
```

The private `MathUtils._()` constructor is a convention that says
*"this class is a utility, don't instantiate it"*.

## Your mission

Finish `lib/math.dart`:

1. `MathUtils.biggest(a, b)` — static ternary.
2. `MathUtils.smallest(a, b)` — static ternary.
3. Keep `MathUtils.pi` as a compile-time constant.

## Run the tests

```bash
cd ex10-static-members && dart pub get && dart test
```
