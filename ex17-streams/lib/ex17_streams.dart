/// Lesson 17 — Streams.
///
/// A `Stream<T>` is a sequence of asynchronous events. Think of it as
/// "a Future that fires more than once". Create streams with an
/// `async*` generator or a `StreamController`, consume them with
/// `await for`, `.listen`, `.map`, `.where`, `.toList`, etc.

import 'dart:async';

/// Yield the integers 1..[n] one at a time, using `async*` + `yield`.
Stream<int> countUpTo(int n) async* {
  throw UnimplementedError('TODO');
}

/// Yield only the even elements of [source].
Stream<int> onlyEvens(Stream<int> source) async* {
  throw UnimplementedError('TODO: await for + if + yield');
}

/// Collect all events of [source] into a list.
Future<List<T>> collect<T>(Stream<T> source) async {
  throw UnimplementedError('TODO: source.toList()');
}

/// Return the first event of [source].
Future<T> firstOf<T>(Stream<T> source) {
  throw UnimplementedError('TODO: source.first');
}

/// Create a broadcast stream that fires integer events on every call
/// to the returned closure.
///
/// The returned record has:
///   * a `stream` you can listen to repeatedly
///   * a `fire` callback that pushes an integer onto the stream
///   * a `close` callback that closes the underlying controller
({Stream<int> stream, void Function(int) fire, Future<void> Function() close})
    makeBroadcastBus() {
  throw UnimplementedError('TODO: StreamController<int>.broadcast()');
}

/// Run [source] and sum its elements, but if the stream emits an
/// error, return -1 instead.
Future<int> sumOrMinusOne(Stream<int> source) {
  throw UnimplementedError('TODO: try/catch around await for');
}

/// Fork [source] into doubled values. The returned stream should emit
/// `2, 4, 6, ...` when [source] emits `1, 2, 3, ...`. Use `.map`.
Stream<int> doubled(Stream<int> source) {
  throw UnimplementedError('TODO: source.map((x) => x * 2)');
}
