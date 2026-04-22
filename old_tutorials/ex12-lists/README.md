# Lesson 12 — Lists

> A `List<T>` is Dart's everyday array. Once you're past `.add()` and
> `[index]`, the fun starts with `map`, `where`, and `fold`.

## The story

```dart
final xs = [1, 2, 3, 4, 5];

xs.map((x) => x * x).toList();            // [1, 4, 9, 16, 25]
xs.where((x) => x.isEven).toList();       // [2, 4]
xs.fold<int>(0, (acc, x) => acc + x);     // 15
```

`.toList()` is needed because `map` and `where` return a lazy
`Iterable`. Converting to `List` eagerly evaluates it.

## Your mission

Implement four helpers in `lib/ex12_lists.dart`:

1. `months()` — literal list of twelve strings.
2. `doubled(xs)` — `.map`.
3. `onlyEvens(xs)` — `.where`.
4. `sumList(xs)` — `.fold`.

## Run the tests

```bash
cd ex12-lists && dart pub get && dart test
```
