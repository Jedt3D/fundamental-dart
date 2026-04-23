import 'package:ex41_functional_style/ex41_functional_style.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 41 — basic: zip, map, function-as-value', () {
    test('VectorMath.pairwiseSum adds element-by-element', () {
      expect(
        VectorMath().pairwiseSum([1, 2, 3], [10, 20, 30]),
        equals([11, 22, 33]),
      );
    });

    test('VectorMath.pairwiseSum stops at the shorter list', () {
      expect(
        VectorMath().pairwiseSum([1, 2, 3, 4], [10, 20]),
        equals([11, 22]),
      );
    });

    test('pairwiseRoster pairs names and scores via the classifier', () {
      final rows = pairwiseRoster(
        ['Ada', 'Grace', 'Linus'],
        [90, 40, 75],
        (score) => score >= 50,
      );
      expect(rows.length, equals(3));
      expect(rows[0], equals((name: 'Ada', score: 90, passing: true)));
      expect(rows[1], equals((name: 'Grace', score: 40, passing: false)));
      expect(rows[2], equals((name: 'Linus', score: 75, passing: true)));
    });

    test('StudentRoster uses its injected classifier', () {
      final strictRoster = StudentRoster((s) => s >= 90);
      final generousRoster = StudentRoster((s) => s >= 50);

      final names = ['Ada', 'Grace'];
      final scores = [95, 60];

      expect(
        strictRoster.rows(names, scores).map((r) => r.passing),
        equals([true, false]),
      );
      expect(
        generousRoster.rows(names, scores).map((r) => r.passing),
        equals([true, true]),
      );
    });
  });

  group('Lesson 41 — advanced: composition', () {
    test('compose runs functions right-to-left', () {
      int addOne(int x) => x + 1;
      int doub(int x) => x * 2;
      int square(int x) => x * x;

      // compose([addOne, doub, square])(3) => addOne(doub(square(3)))
      //                                    = addOne(doub(9))
      //                                    = addOne(18)
      //                                    = 19
      final pipeline = compose<int>([addOne, doub, square]);
      expect(pipeline(3), equals(19));
    });

    test('compose of an empty list is the identity', () {
      final id = compose<int>(const []);
      expect(id(42), equals(42));
    });

    test('GradePipeline formats "name: transformed-score"', () {
      final pipeline = GradePipeline(transform: (s) => s + 5);
      expect(
        pipeline.labels(['Ada', 'Grace'], [90, 40]),
        equals(['Ada: 95', 'Grace: 45']),
      );
    });

    test('GradePipeline works with any transform, including a composed one',
        () {
      int curve(int s) => s + 10;
      int clamp0to100(int s) => s.clamp(0, 100);
      int squashTo90Max(int s) => s > 90 ? 90 : s;

      final transform = compose<int>([squashTo90Max, clamp0to100, curve]);
      final pipeline = GradePipeline(transform: transform);

      expect(
        pipeline.labels(['a', 'b', 'c'], [-5, 50, 95]),
        // -5 -> 5 -> 5 -> 5
        // 50 -> 60 -> 60 -> 60
        // 95 -> 105 -> 100 -> 90
        equals(['a: 5', 'b: 60', 'c: 90']),
      );
    });
  });
}
