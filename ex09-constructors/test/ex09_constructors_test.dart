import 'package:ex09_constructors/user.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 09 — Constructors', () {
    test('default constructor uses named params with defaults', () {
      const u1 = User();
      expect(u1.toString(), equals('User(id: 0, name: anonymous)'));

      const u2 = User(id: 7, name: 'Grace');
      expect(u2.toString(), equals('User(id: 7, name: Grace)'));
    });

    test('named constructor User.anonymous() matches User()', () {
      const u = User.anonymous();
      expect(u.toString(), equals('User(id: 0, name: anonymous)'));
    });

    test('factory User.fromJson(Map) hydrates from JSON-like map', () {
      final u = User.fromJson(<String, Object>{'id': 42, 'name': 'Ada'});
      expect(u.toString(), equals('User(id: 42, name: Ada)'));
      expect(u.toJson(), equals('{"id":42,"name":"Ada"}'));
    });
  });
}
