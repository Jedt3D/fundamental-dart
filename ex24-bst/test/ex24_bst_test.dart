import 'package:ex24_bst/ex24_bst.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 24 — Binary search tree', () {
    test('an empty tree reports size 0 and isEmpty', () {
      final bst = Bst<int>();
      expect(bst.size, equals(0));
      expect(bst.isEmpty, isTrue);
      expect(bst.inOrder(), isEmpty);
    });

    test('insert grows size; duplicates are ignored', () {
      final bst = Bst<int>()
        ..insert(5)
        ..insert(3)
        ..insert(5)
        ..insert(7);
      expect(bst.size, equals(3));
    });

    test('contains finds inserted values and rejects absent ones', () {
      final bst = Bst<int>()
        ..insert(5)
        ..insert(3)
        ..insert(7);
      expect(bst.contains(3), isTrue);
      expect(bst.contains(7), isTrue);
      expect(bst.contains(4), isFalse);
    });

    test('inOrder yields values in ascending order', () {
      final bst = Bst<int>();
      for (final v in [5, 3, 8, 1, 4, 7, 9]) {
        bst.insert(v);
      }
      expect(bst.inOrder(), equals([1, 3, 4, 5, 7, 8, 9]));
    });

    test('works with non-numeric Comparable types', () {
      final bst = Bst<String>()
        ..insert('banana')
        ..insert('apple')
        ..insert('cherry');
      expect(bst.inOrder(), equals(['apple', 'banana', 'cherry']));
      expect(bst.contains('banana'), isTrue);
      expect(bst.contains('durian'), isFalse);
    });

    test('right-skew insert still traverses correctly', () {
      final bst = Bst<int>();
      for (final v in [1, 2, 3, 4, 5]) {
        bst.insert(v);
      }
      expect(bst.inOrder(), equals([1, 2, 3, 4, 5]));
    });
  });
}
