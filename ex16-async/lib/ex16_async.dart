/// Lesson 16 — Futures, async, and await.
///
/// A `Future<T>` is a promise of a value that will arrive later (or
/// an error). Mark a function `async` and you get three things:
///   * the return type is wrapped in `Future<...>`
///   * you can `await` other futures inside
///   * thrown exceptions become future errors
///
/// `Future.delayed`, `Future.value`, `Future.error`, and `Future.wait`
/// are the four bread-and-butter constructors.

/// Return a future that completes with `'Hello, <name>'`.
Future<String> fetchGreeting(String name) async {
  throw UnimplementedError('TODO: await a short delay, then return greeting');
}

/// Return a future that completes after [ms] milliseconds with [value].
Future<T> completesAfter<T>(int ms, T value) {
  throw UnimplementedError('TODO: Future.delayed');
}

/// Return the sum of the integer futures in [futures].
Future<int> sumAll(List<Future<int>> futures) async {
  throw UnimplementedError('TODO: Future.wait');
}

/// Return a future that fails with `FormatException('bad input')`.
Future<int> alwaysFails() async {
  throw UnimplementedError('TODO: throw inside an async function');
}

/// Try [task]; if it throws, return [fallback] instead.
Future<T> tryOr<T>(Future<T> Function() task, T fallback) async {
  throw UnimplementedError('TODO: try/await/catch');
}

/// Chain: fetch [n] via [fetch], then return `n * 2`.
/// Prefer `.then(...)` for this one.
Future<int> fetchAndDouble(Future<int> Function() fetch) {
  throw UnimplementedError('TODO: fetch().then((n) => n * 2)');
}

/// Run [tasks] *sequentially* and return the collected results.
/// Each task must wait for the previous one.
Future<List<int>> runSequential(List<Future<int> Function()> tasks) async {
  throw UnimplementedError('TODO: await in a for-loop');
}

/// Run [tasks] in *parallel* and return the collected results in order.
Future<List<int>> runParallel(List<Future<int> Function()> tasks) async {
  throw UnimplementedError('TODO: Future.wait on tasks.map((t) => t())');
}
