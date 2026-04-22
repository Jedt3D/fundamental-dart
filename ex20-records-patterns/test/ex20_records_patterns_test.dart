import 'package:ex20_records_patterns/ex20_records_patterns.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 20 — Records and patterns', () {
    test('countParity returns a named record', () {
      final r = countParity([1, 2, 3, 4, 5]);
      expect(r.evens, equals(2));
      expect(r.odds, equals(3));
    });

    test('minMax returns a positional record', () {
      final (mn, mx) = minMax([3, 1, 4, 1, 5, 9, 2, 6]);
      expect(mn, equals(1));
      expect(mx, equals(9));
    });

    test('classify uses a switch expression', () {
      expect(classify(0), equals('zero'));
      expect(classify(-3), equals('negative'));
      expect(classify(5), equals('small'));
      expect(classify(1000), equals('big'));
    });

    test('isPointLike matches a map shape', () {
      expect(isPointLike({'type': 'point', 'x': 1, 'y': 2}), isTrue);
      expect(isPointLike({'type': 'circle', 'x': 1, 'y': 2}), isFalse);
      expect(isPointLike({'type': 'point', 'x': 'oops', 'y': 2}), isFalse);
      expect(isPointLike(null), isFalse);
    });

    test('sumFirstThree uses a list pattern', () {
      expect(sumFirstThree([10, 20, 30]), equals(60));
      expect(sumFirstThree([1, 2, 3, 4, 5]), equals(6));
      expect(() => sumFirstThree([1, 2]), throwsA(isA<ArgumentError>()));
    });

    test('describe destructures a named record', () {
      expect(describe((name: 'Ada', age: 36)), equals('Ada is 36'));
    });

    test('labelOf uses record patterns in a switch', () {
      expect(labelOf(('ok', 200)), equals('OK with code 200'));
      expect(labelOf(('error', 'boom')), equals('error: boom'));
      expect(labelOf(('huh', 42)), equals('unknown'));
    });
  });
}
