/// Lesson 09 — Constructors.
///
/// Dart offers several constructor styles:
///   - Default:   `Foo(a, b)`         (one per class)
///   - Named:     `Foo.named(a, b)`   (as many as you like)
///   - Factory:   `factory Foo.fromX(...)` — can return cached/subclass instances
///
/// Finish this `User` model. Private fields `_id` and `_name` are already
/// wired to `toJson()` and `toString()`, so you only need to build the
/// constructors and keep them private.
class User {
  final int _id;
  final String _name;

  /// TODO — default const constructor with named params:
  ///
  ///   const User({int id = 0, String name = 'anonymous'})
  ///     : _id = id, _name = name;
  const User({int id = 0, String name = 'anonymous'})
      : _id = -1,
        _name = 'TODO'; // <- fix me

  /// TODO — named constructor that simply redirects to the default.
  const User.anonymous()
      : _id = -1,
        _name = 'TODO';

  /// TODO — factory that reads `id` (int) and `name` (String) from [json].
  factory User.fromJson(Map<String, Object> json) {
    throw UnimplementedError('TODO');
  }

  /// Already implemented — don't edit unless you want to.
  String toJson() => '{"id":$_id,"name":"$_name"}';

  @override
  String toString() => 'User(id: $_id, name: $_name)';
}
