class User {
  /// This class will represent a simple user data structure named as `User`
  /// このクラスは `User` という名前の単純なユーザーデータ構造を表します
  const User({int id = 0, String name = 'anonymous'})
      : _id = id,
        _name = name;

  const User.anonymous() : this();

  /// `factory` use the factory keyword to identify a default or named constructor.
  /// We use the factory keyword to implement constructors that decides
  /// whether to return a new instance or an existing instance.
  ///
  /// `factory` は、factory キーワードを使用して、
  /// デフォルトまたは名前付きコンストラクターを識別します。
  /// factory キーワードを使用して、新しいインスタンスを返すか、
  /// 既存のインスタンスを返すかを決定するコンストラクターを実装します。
  ///
  factory User.fromJson(Map<String, Object> json) {
    final userId = json['id'] as int;
    final userName = json['name'] as String;
    return User(id: userId, name: userName);
  }

  final String _name;
  final int _id;

  /// Convert to JSON
  String toJson() {
    return '{"id":$_id,"name":"$_name"}';
  }

  @override
  /// Convert to String
  String toString() {
    return 'User(id: $_id, name: $_name)';
  }
}
