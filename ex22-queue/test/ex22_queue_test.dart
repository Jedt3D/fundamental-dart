import 'package:ex22_queue/ex22_queue.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 22 — Queue<T>', () {
    test('a fresh queue is empty', () {
      final q = Queue<int>();
      expect(q.isEmpty, isTrue);
      expect(q.length, equals(0));
    });

    test('enqueue grows length', () {
      final q = Queue<int>()
        ..enqueue(1)
        ..enqueue(2)
        ..enqueue(3);
      expect(q.length, equals(3));
      expect(q.isEmpty, isFalse);
    });

    test('dequeue returns items in insertion order (FIFO)', () {
      final q = Queue<String>()
        ..enqueue('a')
        ..enqueue('b')
        ..enqueue('c');
      expect(q.dequeue(), equals('a'));
      expect(q.dequeue(), equals('b'));
      expect(q.dequeue(), equals('c'));
      expect(q.isEmpty, isTrue);
    });

    test('peek returns the front without removing', () {
      final q = Queue<int>()
        ..enqueue(10)
        ..enqueue(20);
      expect(q.peek(), equals(10));
      expect(q.length, equals(2));
    });

    test('dequeue and peek on empty throw StateError', () {
      final q = Queue<int>();
      expect(q.dequeue, throwsA(isA<StateError>()));
      expect(q.peek, throwsA(isA<StateError>()));
    });
  });
}
