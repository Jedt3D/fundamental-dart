import 'package:ex23_linked_list/ex23_linked_list.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 23 — LinkedList<T>', () {
    test('a fresh list has length 0', () {
      final list = LinkedList<int>();
      expect(list.length, equals(0));
      expect(list.isEmpty, isTrue);
      expect(list.toList(), isEmpty);
    });

    test('prepend adds to the head in reverse order', () {
      final list = LinkedList<int>()
        ..prepend(3)
        ..prepend(2)
        ..prepend(1);
      expect(list.toList(), equals([1, 2, 3]));
      expect(list.length, equals(3));
    });

    test('append adds to the tail in order', () {
      final list = LinkedList<String>()
        ..append('a')
        ..append('b')
        ..append('c');
      expect(list.toList(), equals(['a', 'b', 'c']));
    });

    test('contains finds present and absent elements', () {
      final list = LinkedList<int>()
        ..append(1)
        ..append(2)
        ..append(3);
      expect(list.contains(2), isTrue);
      expect(list.contains(99), isFalse);
    });

    test('remove drops the first matching element', () {
      final list = LinkedList<int>()
        ..append(1)
        ..append(2)
        ..append(3)
        ..append(2);
      expect(list.remove(2), isTrue);
      expect(list.toList(), equals([1, 3, 2]));
      expect(list.length, equals(3));
      expect(list.remove(99), isFalse);
    });

    test('remove works at the head', () {
      final list = LinkedList<int>()
        ..append(1)
        ..append(2);
      expect(list.remove(1), isTrue);
      expect(list.toList(), equals([2]));
    });
  });
}
