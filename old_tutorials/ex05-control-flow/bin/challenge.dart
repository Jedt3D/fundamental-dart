void main() {
  /// Comparison operators: Exercise 1
  ///
  /// Create a constant called `myAge` and set it to your age. Then, create a
  /// constant named `isTeenager` that uses Boolean logic to determine if the
  /// age denotes someone in the age range of 13 to 19.
  ///
  /// 比較演算子: 演習 1
  ///
  /// `myAge` という定数を作成し、自分の年齢に設定します。次に、ブール論理を使用して、
  /// 年齢が 13 歳から 19 歳の範囲の人を表すかどうかを判定する `isTeenager`
  /// という定数を作成します。

  const myAge = 42;
  const isTeenager = myAge >= 13 && myAge <= 19;
  print('isTeenager: $isTeenager');

  /// Comparison operators: Exercise 2
  ///
  /// Create another constant named `maryAge` and set it to `30`. Then, create
  /// a constant named `bothTeenagers` that uses Boolean logic to determine if
  /// both you and Mary are teenagers.
  ///
  /// 比較演算子: 演習 2
  ///
  /// `maryAge` という別の定数を作成し、それを `30` に設定します。次に、ブール論理を使用して、
  /// あなたと Mary の両方が 10 代かどうかを判定する `bothTeenagers` という定数を作成します。

  const maryAge = 30;
  const bothTeenagers = (maryAge >= 13 && maryAge <= 19) && isTeenager;
  print('bothTeenagers: $bothTeenagers');

  /// Comparison operators: Exercise 3
  ///
  /// Create a `String` constant named `reader` and set it to your name. Create
  /// another `String` constant named `ray` and set it to `'Ray Wenderlich'`.
  /// Create a Boolean constant named `rayIsReader` that uses string equality
  /// to determine if `reader` and `ray` are equal.
  ///
  /// 比較演算子: 演習 3
  ///
  /// `reader` という名前の `String` 定数を作成し、自分の名前に設定します。
  /// `ray` という名前の別の `String` 定数を作成し、`'Ray Wenderlich'` に設定します。
  /// 文字列の等価性を使用して `reader` と `ray` が等しいかどうかを判定する `rayIsReader`
  /// という名前のブール定数を作成します。

  const reader = 'Bob Smith';
  const ray = 'Ray Wenderlich';
  const rayIsReader = reader == ray;
  print('rayIsReader: $rayIsReader');

  /// The if statement: Exercise 1
  ///
  /// Create a constant named `myAge` and initialize it with your age. Write
  /// an `if` statement to print out "Teenager" if your age is between `13`
  /// and `19`, and "Not a teenager" if your age is not between `13` and `19`.
  ///
  /// if 文: 演習 1
  ///
  /// `myAge` という定数を作成し、年齢で初期化します。 年齢が `13` から `19`
  /// の間であれば「ティーンエイジャー」と出力し、それ以外の場合は「ティーンエイジャーではない」
  /// と出力する `if` 文を記述します。

  // const myAge = 42; // same as above
  // const isTeenager = myAge >= 13 && myAge <= 19; // same as above
  if (isTeenager) {
    print('Teenager');
  } else {
    print('Not a teenager');
  }

  /// The if statement: Exercise 2
  ///
  /// Use a ternary conditional operator to replace the `else-if` statement
  /// that you used above. Set the result to a variable named `answer`.
  ///
  /// if 文: 演習 2
  ///
  /// 三項条件演算子を使用して、上記で使用した `else-if` 文を置き換えます。
  /// 結果を `answer` という名前の変数に設定します。
  const answer = (isTeenager) ? 'Teenager' : 'Not a teenager';
  print(answer);

  /// Challenge 1: Find the Error
  ///
  /// What's wrong with the following code?
  ///
  /// チャレンジ 1: エラーを見つける
  ///
  /// 次のコードのどこが間違っているでしょうか?
  ///
  /// ```
  /// const firstName = 'Bob';
  /// if (firstName == 'Bob') {
  ///   const lastName = 'Smith';
  /// } else if (firstName == 'Ray') {
  ///   const lastName = 'Wenderlich';
  /// }
  /// final fullName = firstName + ' ' + lastName;
  /// ```

  // `lastName` was declared in the `if` statement scope but was used
  // in the parent scope. You need to declare it at or above the scope
  // where it is needed.
  // `lastName` は `if` ステートメントのスコープ内で宣言されましたが、親スコープ内で使用されました。
  // 必要なスコープ内で、またはそれより上で宣言する必要があります。

  const firstName = 'Bob';
  var lastName = '';
  if (firstName == 'Bob') {
    lastName = 'Smith';
  } else if (firstName == 'Ray') {
    lastName = 'Wenderlich';
  }
  final fullName = firstName + ' ' + lastName;
  print(fullName);

  /// Challenge 2: Boolean Challenge
  ///
  /// In each of the following statements, what is the value of the
  /// Boolean expression?
  ///
  /// ```
  /// true && true
  /// false || false
  /// (true && 1 != 2) || (4 > 3 && 100 < 1)
  /// ((10 / 2) > 3) && ((10 % 2) == 0)
  /// ```

  print(true && true); // true
  print(false || false); // false
  print((true && 1 != 2) || (4 > 3 && 100 < 1)); // true
  print(((10 / 2) > 3) && ((10 % 2) == 0)); // true

  /// Challenge 3: Audio Enumerations
  ///
  /// 1. Make an `enum` called `AudioState` and give it values to represent
  ///    `playing`, `paused` and `stopped` states.
  /// 2. Create a constant called `audioState` and give it an `AudioState` value.
  /// 3. Write a `switch` statement that prints a message based on the value.
  ///
  /// チャレンジ 3: オーディオ列挙
  ///
  /// 1. `AudioState` という `enum` を作成し、`playing`、`paused`、`stopped` の各状態を表す値を指定します。
  /// 2. `audioState` という定数を作成し、`AudioState` 値を指定します。
  /// 3. 値に基づいてメッセージを出力する `switch` ステートメントを記述します。

  // Find the AudioState enum below, outside of the main() function.
  // main() 関数の外で、以下の AudioState 列挙型を見つけます。
  const audioState = AudioState.stopped;
  switch (audioState) {
    case AudioState.playing:
      print('Audio playing');
      break;
    case AudioState.paused:
      print('Audio paused');
      break;
    case AudioState.stopped:
      print('Audio stopped');
      break;
  }
}

enum AudioState {
  playing,
  paused,
  stopped,
}
