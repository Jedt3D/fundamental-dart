import 'package:ex14_maps/ex14_maps.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 14 — Maps', () {
    test('personInfo has the four expected keys', () {
      final m = personInfo();
      expect(m.keys, containsAll(['name', 'profession', 'country', 'city']));
      expect(m.length, equals(4));
    });

    test('updateCity sets city without mutating the original', () {
      final original = <String, String>{
        'name': 'Li Ming',
        'city': 'Beijing',
      };
      final updated = updateCity(original, 'Toronto');
      expect(updated['city'], equals('Toronto'));
      expect(original['city'], equals('Beijing')); // unchanged
    });

    test('countKeys returns the map size', () {
      expect(countKeys(<String, Object?>{}), equals(0));
      expect(countKeys(<String, Object?>{'a': 1, 'b': 2}), equals(2));
    });

    test('valuesOf returns the values in order', () {
      final m = <String, String>{'a': 'x', 'b': 'y', 'c': 'z'};
      expect(valuesOf(m), equals(['x', 'y', 'z']));
    });
  });
}
