# Lesson 41 — Functional-style Dart

> Most Dart is object-oriented. That doesn't mean functional style
> has no place — `map`, `where`, and composing small functions
> are everyday tools for writing code that transforms data
> clearly. This lesson focuses on the three ideas that carry the
> most weight in real codebases: zipping two sequences, injecting
> a function as a value, and composing a pipeline.

## 1. Why this isn't about turning Dart into Haskell

Before we go any further — a warning. Functional style gets worse
when you force it. A plain `for` loop is often the clearest code.
The point is **to have both tools on the table** so you reach for the
right one, not to pretend the whole program is a pipeline.

We stay on the standard library throughout. `package:collection`
(a first-party Dart-team package) gives us `IterableZip`, which is
the one stdlib gap worth filling.

## 2. Zipping — walking two sequences together

Dart's `Iterable` doesn't have a `zip` method by default. Add
`package:collection` and you get:

```dart
import 'package:collection/collection.dart';

final names = ['Ada', 'Grace', 'Linus'];
final scores = [90, 85, 72];
final rows = IterableZip([names, scores]).map((pair) {
  final [name, score] = pair;
  return (name: name as String, score: score as int);
});
```

`IterableZip` stops at the length of the **shortest** iterable — that
matters when `names` and `scores` come from different sources and
might drift out of sync. Defensive code should document that.

`(name: name, score: score)` is a **named record** — the same
lightweight struct we've been using throughout Track V.

## 3. Functions as values

Ruby's blocks, procs, and lambdas all boil down to "a function you
can pass around". Dart's answer is plainer: a function *is* a first
class value. Its type is written with `Function`:

```dart
// Function that takes an int and returns a bool.
bool Function(int) passing = (score) => score >= 50;

// Same thing, as a parameter type:
void apply(bool Function(int) check) {
  print(check(42));
}
```

The `StudentRoster` exercise injects a `bool Function(int)` classifier.
Change the rule — pass a different function. No subclassing, no
strategy-pattern ceremony.

## 4. Composition — small pieces aimed at one direction

Composition means chaining unary functions so the output of one is
the input of the next. In the Ruby lesson it's expressed as
`compose(f, g, h)` returning a single function equivalent to
`x => f(g(h(x)))` — the functions run from right to left, just like
function application.

We'll build a tiny `compose` helper from scratch (no `fpdart`, just
`fold`). The GradePipeline then wires three functions in a row:

```
curve → clamp → label
```

Each step is a unary function you could also test in isolation.
Composed together they read as a sentence, not a flowchart.

## 5. Why we prefer `map` over `for` here

When a loop's whole job is "produce a new list from this one,
transformed in a small way", `map` says that directly. A `for` loop
has to declare a result list, push into it, and return it —
three times the code for no extra clarity. But if the loop also
updates shared state, or breaks early, `map` is the wrong tool.
Clarity first.

## 6. The contract

**Row record**

- `typedef RosterRow = ({String name, int score, bool passing});`

**Static helper**

- `List<RosterRow> pairwiseRoster(List<String> names, List<int>
  scores, bool Function(int) classifier)` — zips the two lists
  (stopping at the shorter), maps each pair to a record using the
  classifier.

**`VectorMath`**

- `List<int> pairwiseSum(List<int> a, List<int> b)` — zip then map.

**`StudentRoster`**

- Constructor: `StudentRoster(bool Function(int) classifier)`.
- `List<RosterRow> rows(List<String> names, List<int> scores)`.

**`compose`**

- `T Function(T) compose<T>(List<T Function(T)> fns)` — returns a
  function that applies the first on the result of the second, etc.
  (right-to-left). Empty list → identity.

**`GradePipeline`**

- Constructor: `GradePipeline({required int Function(int) transform})`.
- `List<String> labels(List<String> names, List<int> scores)` — pairs
  names with `transform(score)` and formats each as `"<name>:
  <transformed>"`.

## 7. Test-driving order

**Basic**

1. `VectorMath.pairwiseSum([1,2,3], [10,20,30])` returns `[11,22,33]`.
2. `VectorMath.pairwiseSum` stops at the shorter list.
3. `pairwiseRoster` builds a list of records using the classifier.
4. `StudentRoster` uses its injected classifier unchanged.

**Advanced**

5. `compose` of three functions runs them right-to-left.
6. `compose` of an empty list is the identity function.
7. `GradePipeline` formats `"name: transformed-score"`.
8. Same pipeline, different composition — the pipeline class is
   oblivious to which functions it holds.

## 8. Run the tests

```bash
cd ex41-functional-style
dart pub get
dart test
```
