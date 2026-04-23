/// Lesson 37 — Rock-Paper-Scissors, built in small sprints.
///
/// Read README.md first — it explains why this looks the way it
/// does. The short version: three tiny objects each do one thing,
/// and the only source of randomness (the computer's next move)
/// lives behind an injectable interface so tests can stay
/// deterministic.
library;

import 'dart:math';

// ---------------------------------------------------------------------------
// Enums — compile-time-checked domain values.
// ---------------------------------------------------------------------------

/// The three moves available in RPS. Using an enum (not a String)
/// means typos are compile errors and `switch` statements over [Move]
/// are exhaustive.
enum Move { rock, paper, scissors }

/// Outcome of a round from the player's perspective.
enum Outcome { win, lose, draw }

// ---------------------------------------------------------------------------
// RoundSummary — a named record, not a class.
//
// Ruby would use a symbol-keyed hash here. Dart 3's named records
// carry the same "read me like a struct" feel with the bonus of
// static type checks on every field access.
// ---------------------------------------------------------------------------

typedef RoundSummary = ({
  Move player,
  Move computer,
  Outcome outcome,
  String message,
});

// ---------------------------------------------------------------------------
// MoveRules — owns the cyclic "what beats what" logic.
// ---------------------------------------------------------------------------

/// Stateless rules engine. Given two moves, decides who wins from
/// player one's perspective.
class MoveRules {
  /// Return [Outcome.win] if [player] beats [computer], etc.
  Outcome decide(Move player, Move computer) {
    throw UnimplementedError(
      'TODO: equal moves => draw; the cycle is rock→scissors→paper→rock',
    );
  }
}

// ---------------------------------------------------------------------------
// Round — plays one round and returns a summary record.
// ---------------------------------------------------------------------------

/// Glue between [MoveRules] and a human-readable summary. Takes a
/// rules instance as a dependency so you can swap in a different
/// one (e.g. RPS-Lizard-Spock) without touching this class.
class Round {
  Round({MoveRules? rules}) : _rules = rules ?? MoveRules();
  final MoveRules _rules;

  /// Resolve one round.
  ///
  /// Returns a [RoundSummary] with:
  ///   * the two moves,
  ///   * the outcome from the player's perspective, and
  ///   * a [message] — `'<winner> beats <loser>'` or `'draw'`,
  ///     using the enum's `name` ("rock", "paper", "scissors").
  RoundSummary play(Move player, Move computer) {
    throw UnimplementedError(
      'TODO: call _rules.decide, then build the record',
    );
  }
}

// ---------------------------------------------------------------------------
// MoveSource — the injection seam.
// ---------------------------------------------------------------------------

/// Anything that can produce the computer's next move.
abstract class MoveSource {
  Move nextMove();
}

/// Deterministic source: hands back [moves] in order. Used in tests
/// so the match engine is reproducible.
///
/// Throws [StateError] if asked for a move after the script is
/// exhausted.
class ScriptedMoveSource implements MoveSource {
  ScriptedMoveSource(this._moves);
  final List<Move> _moves;
  int _index = 0;

  @override
  Move nextMove() {
    throw UnimplementedError(
      'TODO: return _moves[_index++], or throw StateError when exhausted',
    );
  }
}

/// Production source: wraps `dart:math`'s [Random]. The constructor
/// accepts a `Random?` so tests can inject a seeded one if they want
/// repeatable randomness.
class RandomMoveSource implements MoveSource {
  RandomMoveSource([Random? rng]) : _rng = rng ?? Random();
  final Random _rng;

  @override
  Move nextMove() {
    throw UnimplementedError('TODO: return Move.values[_rng.nextInt(3)]');
  }
}

// ---------------------------------------------------------------------------
// MatchEngine — plays turns until someone hits targetWins.
// ---------------------------------------------------------------------------

/// Tracks the running score across turns and declares a match winner
/// once either side has reached [targetWins].
class MatchEngine {
  MatchEngine({
    required Round round,
    required MoveSource source,
    this.targetWins = 2,
  })  : _round = round,
        _source = source;

  final Round _round;
  final MoveSource _source;
  final int targetWins;

  int _playerScore = 0;
  int _computerScore = 0;

  /// Play one turn for the given player move.
  ///
  /// Returns a record containing the round summary, the running
  /// score, and the match winner (if known).
  ///
  /// `matchWinner` is:
  ///   * `'player'`    if the player has reached [targetWins];
  ///   * `'computer'`  if the computer has;
  ///   * `null`        otherwise.
  ({
    RoundSummary round,
    ({int player, int computer}) score,
    String? matchWinner,
  }) playTurn(Move player) {
    throw UnimplementedError(
      'TODO: ask _source for a move, play the round, update the score, '
      'compute the match winner if any, and return the record',
    );
  }
}
