# Lesson 18 — Mixins and extensions

> Dart only allows **single inheritance**, but `mixin` and `extension`
> fill in most of the cases where you'd otherwise reach for it.

## The story

```dart
// Shared behaviour
mixin CallCounter {
  int _calls = 0;
  int get callCount => _calls;
  void track() => _calls++;
}

abstract class HasName { String get name; }

mixin Greeter on HasName {     // on = constraint
  String greet() => 'Hi, $name!';
}

class Person with Greeter, CallCounter implements HasName {
  Person(this.name);
  @override final String name;
}

// Extension methods — add behaviour to existing types
extension PalindromeCheck on String {
  bool get isPalindrome {
    final s = toLowerCase();
    return s == s.split('').reversed.join();
  }
}

'racecar'.isPalindrome;   // true
```

## Your mission

Finish `lib/ex18_mixins_extensions.dart`:

1. `Greeter.greet()` — uses the `name` from `HasName`.
2. `CallCounter.track()` — increments a per-instance counter.
3. `String.isPalindrome` (extension getter) — case-insensitive.
4. `int.factorial()` — extension method.
5. `List<int>.isSortedAscending` — extension getter.

## Run the tests

```bash
cd ex18-mixins-extensions && dart pub get && dart test
```
