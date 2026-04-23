/// Lesson 41 — Functional-style Dart for everyday data problems.
///
/// Read `README.md` first. Short version: three patterns —
/// zipping two sequences, injecting a function as a value, and
/// composing unary functions into a pipeline.
///
/// We stay on the standard library + [package:collection] for
/// [IterableZip] (Dart's built-in `Iterable` has no `zip`).
library;

import 'package:collection/collection.dart';

// ---------------------------------------------------------------------------
// RosterRow — a named record.
//
// Using a record (not a class) because the shape carries no
// behaviour — it's just `(name, score, passing)`.
// ---------------------------------------------------------------------------

typedef RosterRow = ({String name, int score, bool passing});

// ---------------------------------------------------------------------------
// pairwiseRoster — a top-level helper.
//
// Sometimes the clearest form is a plain function, not a class.
// Top-level helpers are Ruby's module methods, roughly.
// ---------------------------------------------------------------------------

/// Walk [names] and [scores] together, building one [RosterRow]
/// per pair. [classifier] decides pass/fail for each score.
///
/// `IterableZip` stops at the shorter of the two inputs — that's
/// intentional. If the two lists have drifted, you get a short
/// result instead of a crash.
List<RosterRow> pairwiseRoster(
  List<String> names,
  List<int> scores,
  bool Function(int) classifier,
) {
  // TODO:
  //   return IterableZip([names, scores])
  //     .map((pair) {
  //       final name = pair[0] as String;
  //       final score = pair[1] as int;
  //       return (name: name, score: score, passing: classifier(score));
  //     })
  //     .toList();
  throw UnimplementedError('TODO');
}

// ---------------------------------------------------------------------------
// VectorMath — zip + map.
// ---------------------------------------------------------------------------

/// Small vector operations that lean on zip + map.
class VectorMath {
  /// Element-wise sum of [a] and [b], stopping at the shorter.
  /// `[1,2,3]` zipped with `[10,20,30]` -> `[11,22,33]`.
  List<int> pairwiseSum(List<int> a, List<int> b) {
    // TODO: IterableZip([a, b]).map((p) => (p[0] as int) + (p[1] as int)).toList()
    throw UnimplementedError('TODO');
  }
}

// ---------------------------------------------------------------------------
// StudentRoster — function-as-value dependency injection.
//
// The classifier is a `bool Function(int)`. There is no subclassing,
// no interface with one method — just a function value we stash.
// ---------------------------------------------------------------------------

/// Pairs names with scores and classifies each with an injected
/// function.
class StudentRoster {
  StudentRoster(this._classifier);
  final bool Function(int score) _classifier;

  /// Delegates to [pairwiseRoster].
  List<RosterRow> rows(List<String> names, List<int> scores) {
    // TODO: return pairwiseRoster(names, scores, _classifier);
    throw UnimplementedError('TODO');
  }
}

// ---------------------------------------------------------------------------
// compose — the smallest useful FP helper.
//
// Runs functions right-to-left, so `compose([f, g, h])(x) == f(g(h(x)))`.
// That matches mathematical composition and the way nested function
// application reads on the page.
// ---------------------------------------------------------------------------

/// Compose a list of unary functions into a single function. An
/// empty list yields the identity.
T Function(T) compose<T>(List<T Function(T)> fns) {
  // TODO:
  //   return (T input) =>
  //       fns.reversed.fold<T>(input, (value, fn) => fn(value));
  throw UnimplementedError('TODO');
}

// ---------------------------------------------------------------------------
// GradePipeline — real use of a composed function.
//
// The GradePipeline itself knows nothing about curving, clamping,
// or labelling. It's given a `transform` — one function — and
// produces `"<name>: <transform(score)>"` lines. Swap the composition
// and the labels change.
// ---------------------------------------------------------------------------

/// Produces human-facing labels from a pair of parallel lists.
class GradePipeline {
  GradePipeline({required this.transform});
  final int Function(int) transform;

  List<String> labels(List<String> names, List<int> scores) {
    // TODO:
    //   return IterableZip([names, scores]).map((p) {
    //     final name = p[0] as String;
    //     final score = p[1] as int;
    //     return '$name: ${transform(score)}';
    //   }).toList();
    throw UnimplementedError('TODO');
  }
}
