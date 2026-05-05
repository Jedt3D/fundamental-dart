# Lesson 07 — Functions

> Functions are the verbs of your program. Dart lets you dress them up
> in several ways: named parameters, optional parameters, defaults,
> arrow bodies, and closures.

## The story

```dart
// Required positional
int add(int a, int b) => a + b;

// Optional positional with defaults
int addUp(int a, int b, [int c = 0, int d = 0]) => a + b + c + d;

// Named parameters (callers use `name:`)
String greet(String name, {String greeting = 'Hello'}) =>
    '$greeting, $name!';

// Closures capture their surrounding variables
int Function() makeCounter() {
  var n = 0;
  return () => ++n;
}
```

## Your mission

Implement four functions in `lib/ex07_functions.dart`:

1. `youAreWonderful(name, {numberPeople})` — named params.
2. `addUp(a, b, [c, d])` — optional positional.
3. `square(n)` — arrow syntax.
4. `makeCounter()` — a closure.

## Run the tests

```bash
cd ex07-functions && dart pub get && dart test
```
