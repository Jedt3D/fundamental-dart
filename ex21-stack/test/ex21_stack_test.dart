import 'package:ex21_stack/ex21_stack.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 21 — Stack<T>', () {
    test('a fresh stack is empty', () {
      final s = Stack<int>();
      expect(s.isEmpty, isTrue);
      expect(s.length, equals(0));
    });

    test('push grows length and marks the stack non-empty', () {
      final s = Stack<int>()
        ..push(1)
        ..push(2)
        ..push(3);
      expect(s.length, equals(3));
      expect(s.isEmpty, isFalse);
    });

    test('pop returns items in reverse insertion order', () {
      final s = Stack<int>()
        ..push(1)
        ..push(2)
        ..push(3);
      expect(s.pop(), equals(3));
      expect(s.pop(), equals(2));
      expect(s.pop(), equals(1));
      expect(s.isEmpty, isTrue);
    });

    test('peek returns the top without removing it', () {
      final s = Stack<String>()
        ..push('a')
        ..push('b');
      expect(s.peek(), equals('b'));
      expect(s.length, equals(2));
    });

    test('pop and peek on an empty stack throw StateError', () {
      final s = Stack<int>();
      expect(s.pop, throwsA(isA<StateError>()));
      expect(s.peek, throwsA(isA<StateError>()));
    });
  });
}
