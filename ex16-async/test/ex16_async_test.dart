import 'package:ex16_async/ex16_async.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 16 — Futures & async/await', () {
    test('fetchGreeting resolves with a personalised greeting', () async {
      expect(await fetchGreeting('Ada'), equals('Hello, Ada'));
    });

    test('completesAfter waits roughly the requested duration', () async {
      final start = DateTime.now();
      final value = await completesAfter(20, 'done');
      final elapsedMs = DateTime.now().difference(start).inMilliseconds;
      expect(value, equals('done'));
      expect(elapsedMs, greaterThanOrEqualTo(15));
    });

    test('sumAll aggregates with Future.wait', () async {
      final result = await sumAll([
        Future.value(1),
        Future.value(2),
        Future.value(3),
      ]);
      expect(result, equals(6));
    });

    test('alwaysFails surfaces a FormatException', () {
      expect(alwaysFails(), throwsA(isA<FormatException>()));
    });

    test('tryOr falls back when the task throws', () async {
      expect(
        await tryOr<int>(() async => 42, -1),
        equals(42),
      );
      expect(
        await tryOr<int>(() async => throw StateError('oops'), -1),
        equals(-1),
      );
    });

    test('fetchAndDouble uses .then to transform the value', () async {
      expect(await fetchAndDouble(() async => 7), equals(14));
      expect(await fetchAndDouble(() async => 0), equals(0));
    });

    test('runSequential waits for each task in turn', () async {
      final order = <int>[];
      Future<int> tagged(int v, int ms) async {
        await Future<void>.delayed(Duration(milliseconds: ms));
        order.add(v);
        return v;
      }

      final results = await runSequential([
        () => tagged(1, 20),
        () => tagged(2, 1),
        () => tagged(3, 1),
      ]);
      expect(results, equals([1, 2, 3]));
      expect(order, equals([1, 2, 3]));
    });

    test('runParallel fans out with Future.wait', () async {
      Future<int> slow(int v, int ms) =>
          Future<int>.delayed(Duration(milliseconds: ms), () => v);

      final start = DateTime.now();
      final results = await runParallel([
        () => slow(1, 30),
        () => slow(2, 30),
        () => slow(3, 30),
      ]);
      final elapsedMs = DateTime.now().difference(start).inMilliseconds;
      expect(results, equals([1, 2, 3]));
      // Running in parallel should be far under the 90ms total.
      expect(elapsedMs, lessThan(80));
    });
  });
}
