/// Lesson 40 — Recursion and closures.
///
/// Read `README.md` for the design and the why.
library;

// ---------------------------------------------------------------------------
// NestedNumberSummer — recursion over "int | List<Object?>".
//
// We're using Dart 3's switch-on-type-patterns here. It's the
// closest Dart gets to Ruby's `case x when Integer then ... when
// Array then ...`, and it fits the shape of recursive data
// structures perfectly.
// ---------------------------------------------------------------------------

/// Sums a value that is either an `int` or a (possibly nested) list
/// of the same shape. Unexpected types throw [ArgumentError].
class NestedNumberSummer {
  /// Recursively sum [node]:
  ///   int       -> node itself
  ///   List<...> -> sum of sum(child) for each child
  int sum(Object node) {
    // TODO — use a switch expression with type patterns.
    //   return switch (node) {
    //     int n => n,
    //     List<Object?> xs => xs.fold<int>(0, (s, c) => s + sum(c as Object)),
    //     _ => throw ArgumentError('unexpected shape: $node'),
    //   };
    throw UnimplementedError('TODO');
  }
}

// ---------------------------------------------------------------------------
// CategoryPaths — recursion over a tree of named records.
//
// The tree node is a named record so the data shape is exactly as
// readable as a Ruby symbol-keyed hash, with static types.
// ---------------------------------------------------------------------------

/// A node in a category tree. Leaves have an empty `children` list.
typedef CategoryNode = ({String title, List<CategoryNode> children});

/// Builds `' > '`-joined paths for every leaf in a [CategoryNode]
/// tree.
class CategoryPaths {
  /// Public entry point.
  List<String> paths(CategoryNode tree) => _walk(tree, const []);

  /// Internal recursive helper. The accumulator `prefix` is passed
  /// explicitly, not hidden in class state — that makes the
  /// recursion easy to reason about.
  List<String> _walk(CategoryNode node, List<String> prefix) {
    // TODO:
    //   final here = [...prefix, node.title];
    //   if (node.children.isEmpty) return [here.join(' > ')];
    //   return [
    //     for (final child in node.children) ..._walk(child, here),
    //   ];
    throw UnimplementedError('TODO');
  }
}

// ---------------------------------------------------------------------------
// Closures — functions that remember.
// ---------------------------------------------------------------------------

/// Returns a **fresh** counter. Each call to the returned function
/// yields the next integer starting at 1. Two counters made by
/// separate `makeCounter()` calls do NOT share state.
int Function() makeCounter() {
  throw UnimplementedError(
    'TODO: declare `var n = 0;` and return `() { n++; return n; }`',
  );
}

/// Returns a predicate that accepts integers `>= min`. The
/// threshold is baked into the returned closure — there is no
/// class, no configuration object.
bool Function(int) thresholdGate(int min) {
  throw UnimplementedError('TODO: return (x) => x >= min');
}

// ---------------------------------------------------------------------------
// TreeTraversal — separates "how to walk the tree" from "which
// nodes to keep". The predicate is a closure, supplied by the caller.
// ---------------------------------------------------------------------------

/// Walks any [CategoryNode] tree and collects the titles of every
/// node for which [match] returns true. Traversal is pre-order
/// (parent, then children).
class TreeTraversal {
  List<String> collect(
    CategoryNode tree,
    bool Function(String title) match,
  ) {
    // TODO: recursive walk; include `tree.title` if match(tree.title)
    // is true, then recurse into children and concatenate.
    throw UnimplementedError('TODO');
  }
}
