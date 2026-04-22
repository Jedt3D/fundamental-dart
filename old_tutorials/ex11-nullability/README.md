# Lesson 11 — Nullability

> Dart refuses to let `null` sneak into a non-nullable type. Once you
> opt in with `?`, you get a small toolbox of null-aware operators to
> deal with the possibility safely.

## The story

```dart
String? profession;          // may be null
profession = 'basketball player';

final maybeUpper = profession?.toUpperCase();   // 'BASKETBALL…' or null
final label      = profession ?? 'unknown';      // never null
final forReal    = profession!;                  // throws if null
```

## Your mission

Implement four functions in `lib/ex11_nullability.dart`:

1. `findProfession({unknown})` — return `null` when unknown.
2. `describe(profession)` — uses `??` for a safe fallback.
3. `parseAge(source)` — safe `int.tryParse`.
4. `upperOrEmpty(s)` — chains `?.` and `??` in one expression.

## Run the tests

```bash
cd ex11-nullability && dart pub get && dart test
```
