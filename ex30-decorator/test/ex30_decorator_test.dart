import 'package:ex30_decorator/ex30_decorator.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 30 — Decorator', () {
    test('plain coffee costs 2.0', () {
      expect(SimpleCoffee().cost, equals(2.0));
      expect(SimpleCoffee().description, equals('coffee'));
    });

    test('adding milk adds 0.5 and updates the description', () {
      final c = Milk(SimpleCoffee());
      expect(c.cost, closeTo(2.5, 1e-9));
      expect(c.description, equals('coffee + milk'));
    });

    test('adding sugar adds 0.25 and updates the description', () {
      final c = Sugar(SimpleCoffee());
      expect(c.cost, closeTo(2.25, 1e-9));
      expect(c.description, equals('coffee + sugar'));
    });

    test('decorators stack in outer-first order', () {
      final c = Sugar(Milk(SimpleCoffee()));
      expect(c.cost, closeTo(2.75, 1e-9));
      expect(c.description, equals('coffee + milk + sugar'));
    });
  });
}
