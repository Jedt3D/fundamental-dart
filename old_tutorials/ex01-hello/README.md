# Lesson 01 — Hello, Dart

> Every journey begins with `print('Hello, World!')`. Dart is no
> exception. Let's make sure your SDK works and pick up a couple of
> tiny Dart idioms on the way.

## The story

A Dart program starts life in a function called `main`. You can run a
program by pointing `dart run` at either:

- a single `.dart` file containing a `main()`, or
- a **package** folder that contains a `bin/*.dart` file with `main()`.

Functions are declared with a return type, a name, and a parameter list:

```dart
String greet(String name) {
  return 'Hello, $name!';
}
```

Notice the `$name` — that's **string interpolation**. Dart looks up the
variable and splices its value into the surrounding string.

## Your mission

Open `lib/ex01_hello.dart` and implement three tiny functions:

1. `greet(name)` — returns `'Hello, <name>!'`.
2. `greetLoud(name)` — the same, but shouted (upper case).
3. `answerToLife()` — returns `42`.

## Run the tests

```bash
cd ex01-hello
dart pub get
dart test
```

You should see three red failures. Make them green one at a time.

## Stuck?

Read the reference solution in `bin/challenge.dart`, or the built-in
library demo in `bin/ex01_hello.dart`.

## Extra credit

- Add a `greetManyTimes(name, times)` helper and write a test for it.
- Try the VS Code gutter icons next to each `test(...)` — they let
  you run a single test in isolation.
