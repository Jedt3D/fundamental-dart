
void main() {
  /// Exercise 1
  ///
  /// Create a constant called `age1` and set it equal to `42`. Create another
  /// constant called `age2` and set it equal to `21`. Check by hovering over
  /// the variable names that the type for both has been inferred correctly as
  /// `int`.
  ///
  /// 演習 1
  ///
  /// `age1` という定数を作成し、`42` に設定します。
  /// `age2` という別の定数を作成し、`21` に設定します。変数名の上にマウスを移動して、両方の型が `int` として正しく推論されていることを確認します。

  const age1 = 42;
  const age2 = 21;

  /// Exercise 2
  ///
  /// Create a constant called `averageAge` and set it equal to the average of
  /// `age1` and `age2` using the operation `(age1 + age2) / 2`. Hover over
  /// `averageAge` to check the type. Then check the result of `averageAge`. Why
  /// is it a `double` if the components are all `int`?
  ///
  /// 演習 2
  ///
  /// `averageAge` という定数を作成し、`(age1 + age2) / 2` という演算を使用して、`age1` と `age2` の平均に設定します。
  /// `averageAge` にマウスを移動して型を確認します。次に、`averageAge` の結果を確認します。
  /// コンポーネントがすべて `int` なのに、なぜ `double` なのでしょうか?

  const averageAge = (age1 + age2) / 2;
  print(averageAge);
  // `averageAge` is a `double` because any time you divide in Dart, the
  // result is a `double`. Division can result in non-integer answers, so
  // making the result an `int` could cause a loss of precision.
  // `averageAge` は `double` です。これは、Dart で除算を行うと、常に結果が `double`
  // になるためです。除算の結果は整数以外の値になる可能性があるため、結果を `int`
  // にすると精度が失われる可能性があります。

  /// Challenge 1: Teacher's Grading
  ///
  /// You're a teacher and in your class attendance is worth 20% of the grade,
  /// the homework is worth 30% and the exam is worth 50%. Your student got 90
  /// points for her attendance, 80 points for her homework and 94 points on
  /// her exam. Calculate her grade as an integer percentage rounded down.
  ///
  /// 課題 1: 教師の採点
  ///
  /// あなたは教師で、授業では出席が成績の 20%、宿題が 30%、試験が 50% を占めます。
  /// 生徒は出席で 90
  /// ポイント、宿題で 80 ポイント、試験で 94 ポイントを獲得しました。
  /// 生徒の成績を整数のパーセンテージで切り捨てて計算します。
  ///
  const attendance = 90;
  const homework = 80;
  const exam = 94;
  const rawGrade = (0.2 * attendance) + (0.3 * homework) + (0.5 * exam);
  final integerGrade = rawGrade.toInt();
  print(integerGrade);

  /// Challenge 2: What Type?
  ///
  /// What is the type of `value`?
  ///
  /// チャレンジ 2: 型は?
  ///
  /// `value` の型は何ですか?
  ///
  /// ```
  /// const value = 10 / 2;
  /// ```

  const value = 10 / 2;
  print(value); // 5.0
  // `value` is a `double`.
  // Division always produces a double in Dart.
  // You can see the type by hovering your mouse pointer over `value`.
  // Dart では除算は常に double を生成します。
  // マウス ポインターを `value` の上に置くと型を確認できます。
}
