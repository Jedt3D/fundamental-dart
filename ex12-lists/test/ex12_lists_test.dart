import 'package:ex12_lists/ex12_lists.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 12 — Lists', () {
    test('months returns the twelve months in order', () {
      final m = months();
      expect(m.length, equals(12));
      expect(m.first, equals('January'));
      expect(m.last, equals('December'));
      expect(m[2], equals('March'));
    });

    test('doubled doubles every element', () {
      expect(doubled(<int>[]), equals(<int>[]));
      expect(doubled([1, 2, 3]), equals([2, 4, 6]));
      expect(doubled([0, -5]), equals([0, -10]));
    });

    test('onlyEvens filters by parity', () {
      expect(onlyEvens([1, 2, 3, 4, 5, 6]), equals([2, 4, 6]));
      expect(onlyEvens([1, 3, 5]), isEmpty);
    });

    test('sumList adds everything up', () {
      expect(sumList(<int>[]), equals(0));
      expect(sumList([1, 2, 3, 4]), equals(10));
      expect(sumList([-3, 3]), equals(0));
    });
  });
}
