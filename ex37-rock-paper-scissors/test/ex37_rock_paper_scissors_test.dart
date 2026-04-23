import 'package:ex37_rock_paper_scissors/ex37_rock_paper_scissors.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 37 — basic: rules and rounds', () {
    test('MoveRules.decide handles the three draws', () {
      final rules = MoveRules();
      for (final m in Move.values) {
        expect(rules.decide(m, m), equals(Outcome.draw));
      }
    });

    test('MoveRules.decide handles the six non-draw combinations', () {
      final rules = MoveRules();
      expect(rules.decide(Move.rock, Move.scissors), equals(Outcome.win));
      expect(rules.decide(Move.scissors, Move.paper), equals(Outcome.win));
      expect(rules.decide(Move.paper, Move.rock), equals(Outcome.win));

      expect(rules.decide(Move.scissors, Move.rock), equals(Outcome.lose));
      expect(rules.decide(Move.paper, Move.scissors), equals(Outcome.lose));
      expect(rules.decide(Move.rock, Move.paper), equals(Outcome.lose));
    });

    test('Round.play produces a correct draw summary', () {
      final s = Round().play(Move.rock, Move.rock);
      expect(s.player, equals(Move.rock));
      expect(s.computer, equals(Move.rock));
      expect(s.outcome, equals(Outcome.draw));
      expect(s.message, equals('draw'));
    });

    test('Round.play describes win and loss using enum names', () {
      final win = Round().play(Move.rock, Move.scissors);
      expect(win.outcome, equals(Outcome.win));
      expect(win.message, equals('rock beats scissors'));

      final loss = Round().play(Move.paper, Move.scissors);
      expect(loss.outcome, equals(Outcome.lose));
      expect(loss.message, equals('scissors beats paper'));
    });
  });

  group('Lesson 37 — advanced: deterministic match engine', () {
    test('ScriptedMoveSource hands out moves in order then throws', () {
      final src = ScriptedMoveSource([Move.rock, Move.paper]);
      expect(src.nextMove(), equals(Move.rock));
      expect(src.nextMove(), equals(Move.paper));
      expect(src.nextMove, throwsA(isA<StateError>()));
    });

    test('MatchEngine tracks the running score across turns', () {
      final engine = MatchEngine(
        round: Round(),
        // computer will throw rock, then scissors, then rock.
        source: ScriptedMoveSource([Move.rock, Move.scissors, Move.rock]),
      );

      // Turn 1: player rock vs computer rock -> draw.
      var t = engine.playTurn(Move.rock);
      expect(t.round.outcome, equals(Outcome.draw));
      expect(t.score, equals((player: 0, computer: 0)));
      expect(t.matchWinner, isNull);

      // Turn 2: player rock vs computer scissors -> player wins.
      t = engine.playTurn(Move.rock);
      expect(t.score, equals((player: 1, computer: 0)));
      expect(t.matchWinner, isNull);

      // Turn 3: player paper vs computer rock -> player wins -> MATCH.
      t = engine.playTurn(Move.paper);
      expect(t.score, equals((player: 2, computer: 0)));
      expect(t.matchWinner, equals('player'));
    });

    test('MatchEngine declares the computer the winner when it hits the cap',
        () {
      final engine = MatchEngine(
        round: Round(),
        source: ScriptedMoveSource([Move.paper, Move.rock]),
        targetWins: 2,
      );

      // Turn 1: rock vs paper -> player loses.
      var t = engine.playTurn(Move.rock);
      expect(t.score, equals((player: 0, computer: 1)));
      expect(t.matchWinner, isNull);

      // Turn 2: scissors vs rock -> player loses again -> COMPUTER.
      t = engine.playTurn(Move.scissors);
      expect(t.score, equals((player: 0, computer: 2)));
      expect(t.matchWinner, equals('computer'));
    });

    test('RandomMoveSource returns a valid Move', () {
      final src = RandomMoveSource();
      expect(Move.values, contains(src.nextMove()));
    });
  });
}
