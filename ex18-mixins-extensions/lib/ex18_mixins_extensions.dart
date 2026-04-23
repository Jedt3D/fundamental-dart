/// Lesson 18 — Mixins and extension methods.
///
/// Mixins let you share behaviour across unrelated classes without
/// multiple inheritance. Extensions let you add methods to *types you
/// don't own*, like `String` and `int`, without touching their source.

/// Marker interface: anything with a public name.
abstract class HasName {
  String get name;
}

/// Mixin that adds a `greet()` method to any class with a `name`.
/// Use the `on` clause to require [HasName].
mixin Greeter on HasName {
  String greet() {
    throw UnimplementedError("TODO: return 'Hi, <name>!'");
  }
}

/// Mixin that counts how many times `track()` has been called. Each
/// instance has its own counter.
mixin CallCounter {
  int _calls = 0;
  int get callCount => _calls;
  void track() {
    throw UnimplementedError('TODO: increment _calls');
  }
}

/// A class that mixes in both [Greeter] and [CallCounter].
class Person with Greeter, CallCounter implements HasName {
  Person(this.name);
  @override
  final String name;
}

/// A class that satisfies [HasName] but doesn't use the mixins.
class NamedTag implements HasName {
  NamedTag(this.name);
  @override
  final String name;
}

// --- Extensions ----------------------------------------------------

/// Extension on `String` that checks for palindromes (ignore case).
extension PalindromeCheck on String {
  bool get isPalindrome {
    throw UnimplementedError('TODO');
  }
}

/// Extension on `int` that adds factorial.
extension IntFactorial on int {
  int factorial() {
    throw UnimplementedError('TODO');
  }
}

/// Extension on `List<int>` that tells whether it is sorted ascending.
extension IntListSorted on List<int> {
  bool get isSortedAscending {
    throw UnimplementedError('TODO');
  }
}
