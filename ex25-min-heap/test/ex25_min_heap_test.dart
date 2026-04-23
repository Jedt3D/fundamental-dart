import 'package:ex25_min_heap/ex25_min_heap.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 25 — MinHeap<T>', () {
    test('empty heap reports isEmpty', () {
      final h = MinHeap<int>();
      expect(h.isEmpty, isTrue);
      expect(h.length, equals(0));
    });

    test('pop and peek on empty throw StateError', () {
      final h = MinHeap<int>();
      expect(h.pop, throwsA(isA<StateError>()));
      expect(h.peek, throwsA(isA<StateError>()));
    });

    test('push updates the length', () {
      final h = MinHeap<int>()
        ..push(5)
        ..push(1)
        ..push(3);
      expect(h.length, equals(3));
    });

    test('peek returns the minimum without removing it', () {
      final h = MinHeap<int>()
        ..push(5)
        ..push(1)
        ..push(3);
      expect(h.peek(), equals(1));
      expect(h.length, equals(3));
    });

    test('pop always returns the current minimum', () {
      final h = MinHeap<int>();
      for (final v in [5, 3, 8, 1, 9, 2, 7]) {
        h.push(v);
      }
      expect(h.pop(), equals(1));
      expect(h.pop(), equals(2));
      expect(h.pop(), equals(3));
    });

    test('popping everything yields a sorted sequence (heap sort)', () {
      final h = MinHeap<int>();
      for (final v in [9, 2, 6, 4, 1, 8, 5, 3, 7]) {
        h.push(v);
      }
      final sorted = <int>[];
      while (!h.isEmpty) {
        sorted.add(h.pop());
      }
      expect(sorted, equals([1, 2, 3, 4, 5, 6, 7, 8, 9]));
    });
  });
}
