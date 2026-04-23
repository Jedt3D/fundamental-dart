# Lesson 16 — Futures and async/await

> A `Future<T>` is Dart's way of saying "I promise — eventually — to
> give you a `T`, or an error." `async`/`await` lets you write code
> that reads like it's synchronous but runs asynchronously.

## The story

```dart
Future<String> fetchGreeting(String name) async {
  await Future<void>.delayed(const Duration(milliseconds: 10));
  return 'Hello, $name';
}

// Run several in parallel and wait for all
final results = await Future.wait([
  fetchGreeting('Ada'),
  fetchGreeting('Grace'),
]);

// Catch errors with try/catch — not callbacks
try {
  await risky();
} on FormatException catch (e) {
  print('oops: $e');
}
```

Rules of thumb:
- Use `await` inside an `async` function — never forget the keyword.
- Use `Future.wait` to run independent things **in parallel**.
- Use a plain `for` loop with `await` when one task depends on the
  previous one.
- `Future.value`, `Future.delayed`, and `Future.error` are the three
  constructors you'll reach for most.

## Your mission

Finish every function in `lib/ex16_async.dart`:

1. `fetchGreeting(name)`
2. `completesAfter(ms, value)`
3. `sumAll(futures)` — `Future.wait` + reduce
4. `alwaysFails()` — demonstrate that thrown errors become future errors
5. `tryOr(task, fallback)` — `try`/`catch` with `async`
6. `fetchAndDouble(fetch)` — `.then` chaining
7. `runSequential(tasks)` — in-order execution
8. `runParallel(tasks)` — `Future.wait`

## Run the tests

```bash
cd ex16-async && dart pub get && dart test
```
