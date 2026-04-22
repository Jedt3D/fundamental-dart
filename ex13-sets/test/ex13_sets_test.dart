import 'package:ex13_sets/ex13_sets.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 13 — Sets', () {
    test('animals contains exactly horse, cow, camel', () {
      expect(animals(), equals({'horse', 'cow', 'camel'}));
    });

    test('unionOf combines two sets', () {
      expect(unionOf({1, 2, 3}, {3, 4, 5}), equals({1, 2, 3, 4, 5}));
      expect(unionOf(<int>{}, {1, 2}), equals({1, 2}));
    });

    test('intersectionOf keeps only the shared elements', () {
      expect(intersectionOf({1, 2, 3}, {3, 4, 5}), equals({3}));
      expect(intersectionOf({1, 2}, {3, 4}), isEmpty);
    });
  });
}
