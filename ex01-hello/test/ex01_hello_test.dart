import 'package:ex01_hello/ex01_hello.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 01 — Hello, Dart', () {
    test('greet() says hello to a name', () {
      expect(greet('Ada'), equals('Hello, Ada!'));
      expect(greet('Dart'), equals('Hello, Dart!'));
    });

    test('greetLoud() shouts the greeting', () {
      expect(greetLoud('Ada'), equals('HELLO, ADA!'));
    });

    test('answerToLife() equals 42', () {
      expect(answerToLife(), equals(42));
    });
  });
}
