import 'package:ex10_static_members/math.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 10 — Static members', () {
    test('MathUtils.pi is a compile-time constant', () {
      expect(MathUtils.pi, closeTo(3.14159265358979, 1e-12));
    });

    test('MathUtils.biggest returns the larger argument', () {
      expect(MathUtils.biggest(3, 7), equals(7));
      expect(MathUtils.biggest(10, -2), equals(10));
      expect(MathUtils.biggest(5.5, 5), equals(5.5));
    });

    test('MathUtils.smallest returns the smaller argument', () {
      expect(MathUtils.smallest(3, 7), equals(3));
      expect(MathUtils.smallest(10, -2), equals(-2));
      expect(MathUtils.smallest(5.5, 5), equals(5));
    });
  });
}
