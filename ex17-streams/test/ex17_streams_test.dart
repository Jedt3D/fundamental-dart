import 'dart:async';

import 'package:ex17_streams/ex17_streams.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 17 — Streams', () {
    test('countUpTo yields 1..n in order', () async {
      expect(await countUpTo(5).toList(), equals([1, 2, 3, 4, 5]));
      expect(await countUpTo(0).toList(), isEmpty);
    });

    test('onlyEvens filters an async stream', () async {
      final src = Stream.fromIterable([1, 2, 3, 4, 5, 6]);
      expect(await onlyEvens(src).toList(), equals([2, 4, 6]));
    });

    test('collect materialises a stream into a list', () async {
      final src = Stream.fromIterable(['a', 'b', 'c']);
      expect(await collect(src), equals(['a', 'b', 'c']));
    });

    test('firstOf yields the very first event', () async {
      final src = Stream.fromIterable([10, 20, 30]);
      expect(await firstOf(src), equals(10));
    });

    test('makeBroadcastBus fans out to multiple listeners', () async {
      final bus = makeBroadcastBus();
      final a = <int>[];
      final b = <int>[];

      bus.stream.listen(a.add);
      bus.stream.listen(b.add);

      await Future<void>.delayed(Duration.zero);
      bus.fire(1);
      bus.fire(2);
      await Future<void>.delayed(Duration.zero);
      await bus.close();

      expect(a, equals([1, 2]));
      expect(b, equals([1, 2]));
    });

    test('sumOrMinusOne handles errors gracefully', () async {
      final ok = Stream.fromIterable([1, 2, 3]);
      expect(await sumOrMinusOne(ok), equals(6));

      final failing = () async* {
        yield 1;
        throw StateError('boom');
      }();
      expect(await sumOrMinusOne(failing), equals(-1));
    });

    test('doubled applies .map to the stream', () async {
      final src = Stream.fromIterable([1, 2, 3]);
      expect(await doubled(src).toList(), equals([2, 4, 6]));
    });
  });
}
