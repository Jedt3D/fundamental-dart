# Lesson 19 — Generics and typedefs

> Generics let you write code once and reuse it for many types — with
> type safety intact. `typedef` names a type (especially a function
> signature) so it reads like English at the call-site.

## The story

```dart
class Pair<A, B> {
  final A first;
  final B second;
  Pair(this.first, this.second);
  Pair<B, A> swap() => Pair(second, first);
}

T identityOf<T>(T x) => x;

// Generic bound: T must be num (or a subtype).
T sumNums<T extends num>(List<T> xs) =>
    xs.fold<T>(0 as T, (a, b) => (a + b) as T);

// typedef makes function types readable
typedef IntBinaryOp = int Function(int, int);
int apply(int a, int b, IntBinaryOp op) => op(a, b);
apply(2, 3, (a, b) => a + b);   // 5
```

## Your mission

Finish `lib/ex19_generics.dart`:

1. `Pair.swap()` — generic method on a generic class.
2. `identityOf<T>(x)` — generic function.
3. `firstOrNull<T>(xs)` — nullable generics.
4. `mapAll<T, R>(xs, f)` — two type parameters.
5. `sumNums<T extends num>(xs)` — generic bound.
6. `combine(a, b, op)` — use the `IntBinaryOp` typedef.
7. `adder()` — return a function typed by the typedef.

## Run the tests

```bash
cd ex19-generics && dart pub get && dart test
```
