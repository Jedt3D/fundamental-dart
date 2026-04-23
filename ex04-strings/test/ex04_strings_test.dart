import 'package:ex04_strings/ex04_strings.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 04 — Strings', () {
    test('joinWithSpace glues two strings with a single space', () {
      expect(joinWithSpace('hello', 'world'), equals('hello world'));
      expect(joinWithSpace('foo', 'bar'), equals('foo bar'));
    });

    test('introduce uses string interpolation', () {
      expect(introduce('Ada', 36), equals("My name is Ada and I'm 36."));
    });

    test('twoLinePoem contains both lines', () {
      final poem = twoLinePoem();
      expect(poem.contains('Roses are red,'), isTrue);
      expect(poem.contains('violets are blue.'), isTrue);
      expect(poem.split('\n').length, greaterThanOrEqualTo(2));
    });

    test('visibleLetterCount ignores whitespace', () {
      expect(visibleLetterCount('hello world'), equals(10));
      expect(visibleLetterCount('   a b c '), equals(3));
    });

    test('reverse reverses a string', () {
      expect(reverse('hello'), equals('olleh'));
      expect(reverse('Dart'), equals('traD'));
      expect(reverse(''), equals(''));
    });
  });
}
