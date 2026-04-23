import 'package:ex07_functions/ex07_functions.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 07 — Functions', () {
    test('youAreWonderful uses a named parameter with a default', () {
      expect(
        youAreWonderful('Bob'),
        equals("You're wonderful, Bob. 1 people think so."),
      );
      expect(
        youAreWonderful('Bob', numberPeople: 10),
        equals("You're wonderful, Bob. 10 people think so."),
      );
    });

    test('addUp accepts 2 to 4 arguments', () {
      expect(addUp(1, 2), equals(3));
      expect(addUp(1, 2, 3), equals(6));
      expect(addUp(1, 2, 3, 4), equals(10));
    });

    test('square uses arrow syntax', () {
      expect(square(4), equals(16));
      expect(square(-3), equals(9));
    });

    test('makeCounter returns an independent closure', () {
      final next = makeCounter();
      expect(next(), equals(1));
      expect(next(), equals(2));
      expect(next(), equals(3));

      // A fresh counter starts from 1 again — state is per-closure.
      final another = makeCounter();
      expect(another(), equals(1));
      expect(next(), equals(4));
    });
  });
}
