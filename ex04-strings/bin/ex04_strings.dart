// If you get the error "Target of URI doesn't exist", make sure you have
// run `dart pub get`. Then restart VS Code.
import "package:characters/characters.dart";

void main() {
  /// Strings and characters
  /// 文字列と文字

  print('Hello, Dart!');
  var greeting = 'Hello, Dart!';
  greeting = 'Hello, Flutter!';
  print(greeting);

  /// Getting characters
  /// 文字を取得する

  const letter = 'a';

  var salutation = 'Hello!';
  print(salutation.codeUnits);

  const dart = '🎯';
  print(dart.codeUnits);
  print(dart.runes);

  /// Unicode grapheme clusters
  /// Unicode 書記素クラスター

  const flag = '🇲🇳';
  print(flag.runes);

  const family = '👨‍👩‍👧‍👦';
  print(family.runes);

  print(family.length);
  print(family.codeUnits.length);
  print(family.runes.length);
  print(family.characters.length);

  /// Single-quotes vs double-quotes
  /// 一重引用符と二重引用符

  print('I like cats');
  print("I like cats");
  print("my cat's food");
  print('my cat\'s food');

  /// Concatenation
  /// 連結

  var message = 'Hello' + ' my name is ';
  const name = 'Ray';
  message += name;
  print(message);

  /// Interpolation
  /// 補間

  // const name = 'Ray';
  const introduction = 'Hello my name is $name';
  print(introduction);

  const oneThird = 1 / 3;
  // const sentence = 'One third is $oneThird.';
  final sentence = 'One third is ${oneThird.toStringAsFixed(3)}.';
  print(sentence);

  /// Multi-line strings
  /// 複数行の文字列

  const bigString = '''
You can have a string 
that contains multiple 
lines
by
doing this.''';
  print(bigString);

  // const oneLine = 'This is only '
  //   'a single '
  //   'line '
  //   'at runtime.';
  const oneLine = 'This is only ' + 'a single ' + 'line ' + 'at runtime.';
  print(oneLine);

  const twoLines = 'This is\ntwo lines.';
  print(twoLines);

  const rawString = r'My name \n is $name.';
  print(rawString);

  /// Inserting characters from their codes
  /// コードから文字を挿入する

  print('I \u2764 Dart\u0021');
  print('I love \u{1F3AF}');
}
