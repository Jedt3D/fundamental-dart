// If you get the error "Target of URI doesn't exist", make sure you have
// run `dart pub get`. Then restart VS Code.
import 'package:characters/characters.dart';

void main() {
  /// Exercise 1
  ///
  /// Create a string constant called `firstName` and initialize it to your
  /// first name. Also create a string constant called `lastName` and
  /// initialize it to your last name.
  /// `firstName` という文字列定数を作成し、それをあなたの
  /// ファーストネームに初期化します。また、`lastName` という文字列定数を作成し、それをあなたの
  /// ラストネームに初期化します。

  const firstName = 'Ray';
  const lastName = 'Wenderlich';

  /// Exercise 2
  ///
  /// Create a string constant called `fullName` by adding the `firstName` and
  /// `lastName` constants together, separated by a space.
  /// `firstName` 定数と `lastName` 定数をスペースで区切って追加し、`fullName`
  /// という文字列定数を作成します。

  const fullName = firstName + ' ' + lastName;
  print(fullName);

  /// Exercise 3
  ///
  /// Using interpolation, create a string constant called `myDetails` that
  /// uses the `fullName` constant to create a string introducing yourself.
  /// For example, Ray Wenderlich's string would read: "Hello, my name is Ray
  /// Wenderlich."
  /// 補間を使用して、`myDetails` という文字列定数を作成します。これは、`fullName`
  /// 定数を使用して、自分自身を紹介する文字列を作成します。
  /// たとえば、Ray Wenderlich の文字列は、「こんにちは、私の名前は Ray です
  /// Wenderlich」となります。

  const myDetails = 'Hello, my name is $fullName.';
  print(myDetails);

  /// Challenge 1: Same Same, but Different
  ///
  /// This string has two flags that look the same. But they aren't! One of
  /// them is the flag of Chad and the other is the flag of Romania.
  ///
  /// ```
  /// const twoCountries = '🇹🇩🇷🇴';
  /// ```
  ///
  /// Which is which?
  ///
  /// **Hint**: Romania's regional indicator sequence is `RO`, and `R` is
  /// `127479` in decimal. Chad, which is _Tishād_ in Arabic and _Tchad_ in
  /// French, has a regional indicator sequence of `TD`. Sequence letter `T`
  /// is `127481` in decimal.
  ///
  /// チャレンジ 1: 同じだけど違う
  ///
  /// この文字列には、同じように見える 2 つの国旗があります。しかし、同じではありません。1
  /// つはチャドの国旗で、もう 1 つはルーマニアの国旗です。
  ///
  /// ```
  /// const twoCountries = '🇹🇩🇷🇴';
  /// ```
  ///
  /// どちらがどちらですか?
  ///
  /// **ヒント**: ルーマニアの地域インジケーター シーケンスは `RO` で、`R` は 10 進数で
  /// `127479` です。アラビア語では _Tishād_、フランス語では _Tchad_
  /// であるチャドの地域インジケーター シーケンスは `TD` です。シーケンス文字 `T`
  /// は 10 進数で `127481` です。

  const twoCountries = '🇹🇩🇷🇴';
  print(twoCountries.runes);
  // (127481, 127465, 127479, 127476)
  // 127481 is T (127465 is D) so the first flag is Chad.
  // 127479 is R (127476 is O) so the second flag is Romania.

  /// Challenge 2: How Many?
  ///
  /// Given the following string:
  ///
  /// ```
  /// const vote = 'Thumbs up! 👍🏿';
  /// ```
  ///
  /// How many UTF-16 code units are there?
  /// How many Unicode code points are there?
  /// How many Unicode grapheme clusters are there?
  ///
  /// チャレンジ 2: いくつありますか?
  ///
  /// 次の文字列があるとします:
  ///
  /// ```
  /// const vote = 'Thumbs up! 👍🏿';
  /// ```
  ///
  /// UTF-16 コード ユニットはいくつありますか?
  /// Unicode コード ポイントはいくつありますか?
  /// Unicode 書記素クラスターはいくつありますか?

  const vote = 'Thumbs up! 👍🏿';
  print(vote.codeUnits.length); // 15
  // There are 15 code units.
  print(vote.runes.length); // 13
  // There are 13 code points.
  print(vote.characters.length); // 12
  // There are 12 grapheme clusters.
  // See pubspec.yaml for the characters package dependency.
  // See the top of this file for the characters package import.

  /// Challenge 3: Find the Error
  ///
  /// What is wrong with the following code?
  ///
  /// ```
  /// const name = 'Ray';
  /// name += ' Wenderlich';
  /// ```
  ///
  /// チャレンジ 3: エラーを見つける
  ///
  /// 次のコードのどこが間違っているでしょうか?
  ///
  /// ```
  /// const name = 'Ray';
  /// name += ' Wenderlich';
  /// ```

  var name = 'Ray';
  name += ' Wenderlich';
  print(name);
  // `const` variables can't be changed, so you need to use `var`.

  /// Challenge 4: In Summary
  ///
  /// What is the value of the constant named `summary`?
  ///
  /// ```
  /// const number = 10;
  /// const multiplier = 5;
  /// final summary = '$number \u00D7 $multiplier = ${number * multiplier}';
  /// ```
  /// チャレンジ 4: まとめ
  ///
  /// `summary` という定数の値は何ですか?
  ///
  /// ```
  /// const number = 10;
  /// const multiplier = 5;
  /// final summary = '$number \u00D7 $multiplier = ${number * multiplier}';
  /// ```
  ///
  const number = 10;
  const multiplier = 5;
  final summary = '$number \u00D7 $multiplier = ${number * multiplier}';
  print(summary);
  // 10 × 5 = 50
}
