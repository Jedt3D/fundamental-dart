# Lesson 37 — Rock-Paper-Scissors, grown in small sprints

> The point of this lesson is **not** "can you code RPS" — you almost
> certainly can, top to bottom, in a single sprint. The point is to
> feel what it's like to grow a small system one tested behaviour at
> a time, and to *practice dependency injection* in the one spot
> where it matters: the computer's moves.

## 1. Why this domain is worth it

Rock-Paper-Scissors is the perfect teaching domain:

- The rules are small enough to fit in your head, but non-trivial —
  three outcomes (win / lose / draw) and a cyclic winning relation.
- It naturally splits into three concerns: **rules** (who beats
  whom?), **round** (what just happened?), and **match** (what's the
  score, is it over yet?).
- It has *one* unpredictable input — the computer's move — which is
  the hook we use to learn dependency injection. In production, that
  unpredictable input is often the system clock, the network, or a
  third-party service. Same pattern.

## 2. Design thinking — three small objects, not one big one

The naive script would be a single `playGame()` function: read input,
pick a random move for the computer, decide a winner, update a score,
check if the match is over, print a result, loop. It works — but every
new requirement (play best-of-7, silent mode for tests, log outcomes
to a file) forces you to edit the same monster.

We split it like this:

1. **`MoveRules`** owns the cycle "rock beats scissors, scissors beats
   paper, paper beats rock". Given two moves, it returns an
   [Outcome] from player-one's perspective.
2. **`Round`** takes a `MoveRules` as a dependency and returns a
   summary **named record** describing what happened in one turn.
3. **`MatchEngine`** plays turns until someone hits `targetWins`.
   It asks a `MoveSource` for the computer's next move on each turn.
   In tests we inject a `ScriptedMoveSource` that hands back a
   predetermined sequence; in a real app you'd inject a
   `RandomMoveSource`.

Now each piece changes for its own reason, and none of the interesting
code depends on randomness.

## 3. Enums vs strings — why we use enums here

The Ruby version uses strings (`"rock"`, `"paper"`, `"scissors"`).
That's flexible — any string is allowed — which is also the problem:
a typo doesn't fail until the game actually runs, and the type system
can't help you.

Dart has first-class enums; we use them.

```dart
enum Move   { rock, paper, scissors }
enum Outcome { win, lose, draw }
```

Now `Move.rok` is a compile error. `switch` expressions on enums are
exhaustive — if you add a new move the compiler will tell you every
place that needs updating.

## 4. Records for round summaries

A round summary in Ruby is a hash:

```ruby
{ player_move: :rock, computer_move: :scissors, outcome: :win, message: "rock beats scissors" }
```

In Dart, this is a perfect fit for a **named record**:

```dart
typedef RoundSummary = ({
  Move player,
  Move computer,
  Outcome outcome,
  String message,
});
```

Records are value types (equality by component), immutable, and free
to create. You get the readable-like-a-hash feel *and* every field
access is statically type-checked. No class, no `@override`, no
constructor boilerplate.

## 5. Dependency injection for the computer's moves

Here's the interface we inject:

```dart
abstract class MoveSource {
  Move nextMove();
}
```

- In production, `RandomMoveSource` wraps `dart:math`'s `Random`.
- In tests, we use a tiny `ScriptedMoveSource(List<Move> moves)` that
  returns them in order. Because the tests drive the sequence, every
  test is **deterministic** — no flaky "once in 27 runs" failures.

## 6. The contract

**`MoveRules`**

- `Outcome decide(Move player, Move computer)` — returns `win`,
  `lose`, or `draw` from player-one's perspective.

**Round summary record**

- `({Move player, Move computer, Outcome outcome, String message})`
- `message` is `'<winner> beats <loser>'` or `'draw'`.

**`Round`**

- `Round({MoveRules rules})` — defaults to a fresh rules instance.
- `RoundSummary play(Move player, Move computer)`.

**`MoveSource`**

- `abstract class` with a single `Move nextMove()`.
- Concrete: `ScriptedMoveSource(List<Move>)` (ships here).
- Concrete: `RandomMoveSource([Random?])` (also ships here — we test
  its type only).

**`MatchEngine`**

- `MatchEngine({required Round round, required MoveSource source,
  int targetWins = 2})`.
- `({RoundSummary round, ({int player, int computer}) score,
  String? matchWinner}) playTurn(Move player)` — the `matchWinner`
  is `'player'`, `'computer'`, or `null` while the match is ongoing.

## 7. Test-driving order

The test file splits into two groups — work top-down.

**Basic**

1. `MoveRules.decide` handles all nine combinations correctly.
2. `Round.play` produces a correct summary for a draw.
3. `Round.play` produces a correct summary for a win and a loss.

**Advanced**

4. `ScriptedMoveSource` hands out moves in order.
5. `MatchEngine` tracks the running score.
6. `MatchEngine` declares a match winner once someone hits `targetWins`.
7. `MatchEngine` keeps `matchWinner` null before the target is reached.
8. The whole engine is deterministic under a scripted source — the
  same script produces the same final state every time.

## 8. Run the tests

```bash
cd ex37-rock-paper-scissors
dart pub get
dart test
```
