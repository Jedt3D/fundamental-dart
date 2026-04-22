# Lesson 09 — Constructors

> A class can have more than one way to be born. Dart gives you a
> *default* constructor, any number of *named* constructors, and
> *factory* constructors that get the final say on what instance to
> return.

## The story

```dart
class User {
  final int id;
  final String name;

  // Default, with named params and defaults
  const User({this.id = 0, this.name = 'anonymous'});

  // Named constructor, redirecting to the default
  const User.anonymous() : this();

  // Factory — can return cached or subclass instances
  factory User.fromJson(Map<String, Object> json) =>
      User(id: json['id'] as int, name: json['name'] as String);
}
```

## Your mission

Open `lib/user.dart` and make the three constructors work:

1. `User({id, name})` — default, both named, sensible defaults.
2. `User.anonymous()` — redirects to the default.
3. `User.fromJson(map)` — factory that reads fields out of a `Map`.

## Run the tests

```bash
cd ex09-constructors && dart pub get && dart test
```
