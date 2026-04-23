# Lesson 01 — Hello, Dart

> Every journey begins with `print('Hello, World!')`. Dart is no
> exception. Let's make sure your SDK works and pick up a couple of
> tiny Dart idioms on the way.

## The story

A Dart program starts life in a function called `main`. In this course
we drive everything through `dart test` — the `test/` folder is our
entry point, and the behaviour of `lib/` is what we grow.

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

Re-read the doc comments in `lib/ex01_hello.dart` — every function
has a hint. The test names in `test/ex01_hello_test.dart` are the
final contract: if the test can see the behaviour, your code is
right.

## Extra credit

- Add a `greetManyTimes(name, times)` helper and write a test for it.
- Try the VS Code gutter icons next to each `test(...)` — they let
  you run a single test in isolation.
