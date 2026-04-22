import 'package:ex11_nullability/ex11_nullability.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 11 — Nullability', () {
    test('findProfession returns null when unknown', () {
      expect(findProfession(unknown: true), isNull);
      expect(findProfession(unknown: false), equals('chef'));
    });

    test('describe uses ?? to substitute "mystery" for null', () {
      expect(describe(null), equals('You are a mystery.'));
      expect(describe('pilot'), equals('You are a pilot.'));
    });

    test('parseAge returns null for non-numeric strings', () {
      expect(parseAge('42'), equals(42));
      expect(parseAge('zero'), isNull);
      expect(parseAge(''), isNull);
    });

    test('upperOrEmpty handles null with ?. and ??', () {
      expect(upperOrEmpty(null), equals(''));
      expect(upperOrEmpty('hello'), equals('HELLO'));
    });
  });
}
