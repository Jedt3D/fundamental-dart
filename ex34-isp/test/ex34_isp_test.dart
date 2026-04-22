import 'package:ex34_isp/ex34_isp.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 34 — ISP', () {
    test('Human implements all three role interfaces', () {
      final h = Human();
      expect(h, isA<Workable>());
      expect(h, isA<Eatable>());
      expect(h, isA<Sleepable>());
      expect(h.eat(), equals('yum'));
      expect(h.sleep(), equals('zzz'));
    });

    test('Robot only implements Workable', () {
      final r = Robot();
      expect(r, isA<Workable>());
      expect(r, isNot(isA<Eatable>()));
      expect(r, isNot(isA<Sleepable>()));
      expect(r.work(), equals(24));
    });

    test('Manager depends only on Workable', () {
      final m = Manager();
      expect(m.totalHours([Human(), Robot()]), equals(32));
    });

    test('Manager works on an empty iterable', () {
      expect(Manager().totalHours([]), equals(0));
    });
  });
}
