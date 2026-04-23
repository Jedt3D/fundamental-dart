/// Lesson 26 — Singleton pattern.
///
/// "Only one instance exists — ever." In Dart the canonical
/// implementation uses a private constructor and a `factory`
/// constructor that returns a cached instance.

class Logger {
  // TODO: implement the singleton.
  //
  // Hint (don't peek until you've tried):
  //   Logger._internal();
  //   static final Logger _instance = Logger._internal();
  //   factory Logger() => _instance;

  /// Current accumulated log.
  final List<String> _entries = [];

  List<String> get entries => List.unmodifiable(_entries);

  void log(String message) {
    throw UnimplementedError('TODO: append to _entries');
  }

  /// Wipe the log. Useful between tests.
  void reset() {
    throw UnimplementedError('TODO');
  }
}
