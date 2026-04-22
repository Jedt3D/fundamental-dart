import 'package:ex28_observer/ex28_observer.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 28 — Observer', () {
    test('subscribe adds an observer', () {
      final subject = Subject<int>();
      expect(subject.listenerCount, equals(0));
      subject.subscribe((_) {});
      expect(subject.listenerCount, equals(1));
    });

    test('notify fans out to all observers', () {
      final subject = Subject<int>();
      final seenA = <int>[];
      final seenB = <int>[];
      subject
        ..subscribe(seenA.add)
        ..subscribe(seenB.add)
        ..notify(1)
        ..notify(2);
      expect(seenA, equals([1, 2]));
      expect(seenB, equals([1, 2]));
    });

    test('unsubscribe stops receiving events', () {
      final subject = Subject<int>();
      final seen = <int>[];
      void listener(int e) => seen.add(e);
      subject
        ..subscribe(listener)
        ..notify(1)
        ..unsubscribe(listener)
        ..notify(2);
      expect(seen, equals([1]));
      expect(subject.listenerCount, equals(0));
    });

    test('notify preserves subscription order', () {
      final subject = Subject<String>();
      final log = <String>[];
      subject
        ..subscribe((e) => log.add('A:$e'))
        ..subscribe((e) => log.add('B:$e'))
        ..notify('hi');
      expect(log, equals(['A:hi', 'B:hi']));
    });

    test('unsubscribing an unknown observer is a no-op', () {
      final subject = Subject<int>();
      expect(() => subject.unsubscribe((_) {}), returnsNormally);
    });
  });
}
