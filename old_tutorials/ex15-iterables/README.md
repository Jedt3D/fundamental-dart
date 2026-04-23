# Lesson 15 — Custom iterables

> Any class that implements `Iterable` plays nicely with `for-in`,
> `.map`, `.where`, `.take`, `.fold` and friends. You only have to
> provide one thing: an `Iterator`.

## The story

```dart
class HundredSquares extends Iterable<int> {
  @override
  Iterator<int> get iterator => SquaredIterator();
}

class SquaredIterator implements Iterator<int> {
  int _index = 0;

  @override
  bool moveNext() {
    _index++;
    return _index <= 100;
  }

  @override
  int get current => _index * _index;
}

for (final sq in HundredSquares().take(5)) {
  print(sq);   // 1, 4, 9, 16, 25
}
```

## Your mission

Finish `lib/squares.dart` and `lib/ex15_iterables.dart`:

1. Implement `SquaredIterator.moveNext` and `current`.
2. Implement `firstSquares(n)` using `.take`.
3. Implement `sumOfFirstNSquares(n)` using `.fold`.
4. Implement `containsSquare(x)` using `.any`.

## Run the tests

```bash
cd ex15-iterables && dart pub get && dart test
```
