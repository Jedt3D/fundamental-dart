# Lesson 17 — Streams

> A `Stream<T>` is a `Future<T>` that can fire many times. You get them
> from files, sockets, timers, `StreamController`s, and `async*`
> generator functions.

## The story

```dart
// async generator — yields events over time
Stream<int> count(int n) async* {
  for (var i = 1; i <= n; i++) yield i;
}

await for (final x in count(3)) print(x);  // 1 2 3

// StreamController — push-based streams
final ctrl = StreamController<int>.broadcast();
ctrl.stream.listen(print);
ctrl.add(42);
await ctrl.close();

// map / where / toList — like iterables
Stream.fromIterable([1,2,3]).map((x) => x * 2);
```

## Your mission

Finish `lib/ex17_streams.dart`:

1. `countUpTo(n)` — `async*` generator.
2. `onlyEvens(source)` — `await for` + `yield`.
3. `collect(source)` — `.toList()`.
4. `firstOf(source)` — `.first`.
5. `makeBroadcastBus()` — `StreamController.broadcast`.
6. `sumOrMinusOne(source)` — try/catch around `await for`.
7. `doubled(source)` — `.map`.

## Run the tests

```bash
cd ex17-streams && dart pub get && dart test
```
