import 'package:ex26_singleton/ex26_singleton.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 26 — Singleton', () {
    setUp(() => Logger().reset());

    test('two calls to Logger() return the same instance', () {
      final a = Logger();
      final b = Logger();
      expect(identical(a, b), isTrue);
    });

    test('log entries persist across references', () {
      Logger().log('hello');
      Logger().log('world');
      expect(Logger().entries, equals(['hello', 'world']));
    });

    test('reset clears the log', () {
      Logger().log('to be cleared');
      Logger().reset();
      expect(Logger().entries, isEmpty);
    });

    test('entries is unmodifiable from the outside', () {
      Logger().log('x');
      expect(
        () => Logger().entries.add('sneaky'),
        throwsA(isA<UnsupportedError>()),
      );
    });
  });
}
