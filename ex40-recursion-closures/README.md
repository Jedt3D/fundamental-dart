# Lesson 40 — Recursion and closures

> Two big ideas in one lesson. They keep showing up together in
> real code because recursion often needs a way to remember state
> across the recursive calls, and a closure is the lightest-weight
> way to do that.

## 1. Recursion, the honest version

Every recursive function is just two cases:

1. **Base case** — inputs small enough to answer directly.
2. **Recursive case** — break the input into a smaller piece,
   call yourself on it, combine the result.

That's the whole pattern. If either case is missing, the function
loops or lies. The exercises here make that split visible.

## 2. Walking nested data with Dart 3 patterns

Consider a "nested number":

```
5
[1, 2, 3]
[1, [2, [3, 4]], 5]
```

A number is worth itself. A list is worth the sum of what its
children are worth. In Ruby you'd use `is_a?` to distinguish. Dart
3's **switch on type patterns** expresses this beautifully:

```dart
int sum(Object node) => switch (node) {
      int n => n,
      List<Object?> xs => xs.fold<int>(0, (s, child) => s + sum(child!)),
      _ => throw ArgumentError('unexpected shape: $node'),
    };
```

Notice the shape of the code is now *the same* as the shape of the
data. That's not an accident — it's why pattern matching is such a
big deal.

## 3. Trees of categories

Real-world data: a tree of categories, each with a title and
children. We want every leaf path as a `' > '`-joined string:

```
electronics
├── phones
│   └── smartphones        → "electronics > phones > smartphones"
└── accessories
    ├── cables             → "electronics > accessories > cables"
    └── chargers           → "electronics > accessories > chargers"
```

The recursive function takes the current node **and** the prefix
(what got us here). The prefix is the whole closure-like trick —
we carry the "where we are" state explicitly, which is clearer than
relying on mutable class state.

## 4. Closures — functions that remember

A closure is a function that *closes over* variables from its
surrounding scope. The classic demo is a counter factory:

```dart
int Function() makeCounter() {
  var n = 0;
  return () {
    n++;
    return n;
  };
}

final next = makeCounter();
next();  // 1
next();  // 2
```

The inner function still has access to `n` after `makeCounter`
returns — that's the closure. Two counters from the same factory
have **independent** state; that's why you return a fresh closure
each time.

### Closures as tiny strategies

Once you can build closures at will, you can use them as light-weight
strategies. `thresholdGate(int min)` returns a predicate that accepts
integers above the threshold. The threshold is baked into the
returned function — no class, no constructor.

## 5. Why separate "traversal" from "what to do at each node"

The final exercise mirrors the Ruby lesson's punchline:
`TreeTraversal.collect(tree, predicate)` walks a tree and returns
every node whose title matches a **closure** you inject.

Keeping the recursive walk and the "does this one count?" question
apart means you can reuse the same traversal for fifteen different
predicates without touching it. Same idea as the strategy pattern
from lesson 29 — closures make it cheaper.

## 6. The contract

**`NestedNumberSummer`**

- `int sum(Object node)` — handles `int` and `List<Object?>`.
  Anything else throws `ArgumentError`.

**`CategoryPaths`**

- Tree nodes are **named records**:
  `typedef CategoryNode = ({String title, List<CategoryNode> children});`
- `List<String> paths(CategoryNode tree)` — one path per leaf,
  joined with `' > '`.

**Closures**

- `int Function() makeCounter()` — each call returns a *fresh* counter
  that starts at 1 and increments on every call.
- `bool Function(int) thresholdGate(int min)` — returns `(x) => x >= min`.

**`TreeTraversal`**

- `List<String> collect(CategoryNode tree, bool Function(String title) match)`
  — recursively visits every node; returns the `title` of each node
  the predicate accepts, in pre-order (parent before children).

## 7. Test-driving order

**Basic**

1. `sum(5)` returns 5; `sum([1, 2, 3])` returns 6.
2. `sum` works over deeply nested structures.
3. `sum` throws `ArgumentError` for unexpected types.
4. `CategoryPaths.paths` produces every leaf path.

**Advanced**

5. `makeCounter` yields 1, 2, 3…; fresh counters are independent.
6. `thresholdGate(10)` makes a closure that accepts 10+ and rejects
   below.
7. `TreeTraversal.collect` uses the injected closure — same tree,
   different predicate, different result.

## 8. Run the tests

```bash
cd ex40-recursion-closures
dart pub get
dart test
```
