import 'package:ex33_lsp/ex33_lsp.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 33 — LSP', () {
    test('Sparrow substitutes for Flier', () {
      expect(sendOnAerialMission(Sparrow()), equals('sparrow flaps away'));
    });

    test('Penguin substitutes for Swimmer (but not Flier)', () {
      expect(sendOnAquaticMission(Penguin()), equals('penguin dives in'));
      expect(Penguin(), isNot(isA<Flier>()));
    });

    test('Duck substitutes for both Flier and Swimmer', () {
      final d = Duck();
      expect(sendOnAerialMission(d), equals('duck flaps away'));
      expect(sendOnAquaticMission(d), equals('duck dives in'));
    });
  });
}
