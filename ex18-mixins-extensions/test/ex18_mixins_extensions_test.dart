import 'package:ex18_mixins_extensions/ex18_mixins_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 18 — Mixins and extensions', () {
    test('Greeter.greet() uses the name from HasName', () {
      expect(Person('Ada').greet(), equals('Hi, Ada!'));
      expect(Person('Grace').greet(), equals('Hi, Grace!'));
    });

    test('CallCounter counts per-instance', () {
      final a = Person('A');
      final b = Person('B');

      a
        ..track()
        ..track()
        ..track();
      b.track();

      expect(a.callCount, equals(3));
      expect(b.callCount, equals(1));
    });

    test('Person still satisfies HasName', () {
      final HasName h = Person('Ada');
      expect(h.name, equals('Ada'));
    });

    test('NamedTag is HasName but cannot greet', () {
      final tag = NamedTag('v1');
      expect(tag, isA<HasName>());
      expect(tag, isNot(isA<Greeter>()));
    });

    test('String.isPalindrome ignores case', () {
      expect('racecar'.isPalindrome, isTrue);
      expect('Racecar'.isPalindrome, isTrue);
      expect('hello'.isPalindrome, isFalse);
      expect(''.isPalindrome, isTrue);
    });

    test('int.factorial computes n!', () {
      expect(0.factorial(), equals(1));
      expect(5.factorial(), equals(120));
      expect(1.factorial(), equals(1));
    });

    test('List<int>.isSortedAscending', () {
      expect([1, 2, 3].isSortedAscending, isTrue);
      expect([1, 1, 2].isSortedAscending, isTrue);
      expect([3, 1, 2].isSortedAscending, isFalse);
      expect(<int>[].isSortedAscending, isTrue);
    });
  });
}
