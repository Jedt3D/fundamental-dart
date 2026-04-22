# Lesson 13 — Sets

> A `Set<T>` holds each value at most once. Use it whenever duplicates
> would be noise — tags, visited nodes, unique IDs.

## The story

```dart
final a = {1, 2, 3};
final b = {3, 4, 5};

a.union(b);          // {1, 2, 3, 4, 5}
a.intersection(b);   // {3}
a.difference(b);     // {1, 2}

a.contains(2);       // true
a.add(2);            // no-op
```

## Your mission

Implement three helpers in `lib/ex13_sets.dart`:

1. `animals()` — a literal set.
2. `unionOf(a, b)` — wraps `Set.union`.
3. `intersectionOf(a, b)` — wraps `Set.intersection`.

## Run the tests

```bash
cd ex13-sets && dart pub get && dart test
```
