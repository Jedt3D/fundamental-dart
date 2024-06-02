import 'dart:math';

void main() {
  /// Arithmetic operations exercise
  ///
  /// Print the value of `1` over the square root of `2`.
  /// Confirm that it equals the sine of `45°`.

  // Remember to add the `dart:math` import at the top of the file.
  /// 算術演算の演習
  ///
  /// `1` の値を `2` の平方根で割った値を出力します。
  /// それが `45°` の正弦に等しいことを確認します。

  // ファイルの先頭に `dart:math` インポートを追加することを忘れないでください。
  print(sin(45 * pi / 180));
  print(1 / sqrt(2));

  /// Naming data: Exercise 1
  ///
  /// Declare a constant of type `int` called `ageMe` and set it to your age.
  /// データの命名: 演習 1
  ///
  /// `ageMe` という `int` 型の定数を宣言し、自分の年齢に設定します。

  const myAge = 98;
  print(myAge);

  /// Naming data: Exercise 2
  ///
  /// Declare a variable of type `double` called `averageAge`. Initially, set
  /// the variable to your own age. Then, set it to the average of your age and
  /// your best friend's age.
  /// データの命名: 演習 2
  ///
  /// `double` 型の `averageAge` という変数を宣言します。最初に、変数を自分の年齢に設定します。
  /// 次に、自分の年齢と親友の年齢の平均に設定します。

  double averageAge = 98;
  averageAge = (98 + 27) / 2;
  print(averageAge);

  /// Naming data: Exercise 3
  ///
  /// Create a constant called `testNumber` and initialize it with whatever
  /// integer you'd like. Next, create another constant called `evenOdd` and
  /// set it equal to `testNumber` modulo `2`. Now change `testNumber` to
  /// various numbers. What do you notice about `evenOdd`?
  /// データの命名: 演習 3
  ///
  /// `testNumber` という定数を作成し、任意の整数で初期化します。次に、`evenOdd` という別の定数を作成し、
  /// `testNumber` を `2` で割った値に設定します。次に、`testNumber` を
  /// さまざまな数値に変更します。`evenOdd` について何に気付きましたか?

  const testNumber = 42;
  const evenOdd = testNumber % 2;
  print(evenOdd);
  // `evenOdd` is 0 if `testNumber` is even.
  // `evenOdd` is 1 if `testNumber` is odd.

  /// Challenge 1: Variable Dogs
  ///
  /// Declare an `int` variable called `dogs` and set that equal to the number of dogs
  /// you own. Then imagine you bought a new puppy and increment the `dogs`
  /// variable by one.
  // `testNumber` が偶数の場合、`evenOdd` は 0 になります。
  // `testNumber` が奇数の場合、`evenOdd` は 1 になります。

  /// チャレンジ 1: 変数 Dogs
  ///
  /// `dogs` という `int` 変数を宣言し、所有している犬の数に設定します。次に、
  /// 新しい子犬を購入したと仮定して、`dogs`
  /// 変数を 1 増やします。

  var dogs = 101;
  dogs++;
  print(dogs);

  /// Challenge 2: Make it compile
  ///
  /// Given the following code:
  ///
  /// ```
  /// age = 16;
  /// print(age);
  /// age = 30;
  /// print(age);
  /// ```
  ///
  /// Modify the first line so that the code compiles. Did you use `var`, `int`,
  /// `final` or `const`?
  /// 課題 2: コンパイルできるようにする
  ///
  /// 次のコードがあるとします:
  ///
  /// ```
  /// age = 16;
  /// print(age);
  /// age = 30;
  /// print(age);
  /// ```
  ///
  /// コードがコンパイルされるように最初の行を変更します。`var`、`int`、
  /// `final`、または `const` を使用しましたか?

  var age = 16;
  print(age);
  age = 30;
  print(age);
  // Using `int` rather than `var` would also have made it compile. However,
  // the general practice is to use `var` if the type is known and obvious from
  // from the value.
  // `var` ではなく `int` を使用すると、コンパイルも可能になります。ただし、
// 型がわかっていて、値から明らかな場合は、一般的に `var` を使用します。

  /// Challenge 3: Compute the answer
  ///
  /// Consider the following code:
  ///
  /// ```
  /// const x = 46;
  /// const y = 10;
  /// ```
  ///
  /// Work out what each answer equals when you add the following lines of code
  /// to the code above:
  ///
  /// ```
  /// const answer1 = (x * 100) + y;
  /// const answer2 = (x * 100) + (y * 100);
  /// const answer3 = (x * 100) + (y / 10);
  /// ```


  /// 課題 3: 答えを計算する
  ///
  /// 次のコードを検討してください:
  ///
  /// ```
  /// const x = 46;
  /// const y = 10;
  /// ```
  ///
  /// 上記のコードに次のコード行を追加した場合、各答えが何に等しいかを計算します:
  ///
  /// ```
  /// const answer1 = (x * 100) + y;
  /// const answer2 = (x * 100) + (y * 100);
  /// const answer3 = (x * 100) + (y / 10);
  /// ```

  const x = 46;
  const y = 10;

  // 1
  const answer1 = (x * 100) + y;
  print(answer1); // 4610

  // 2
  const answer2 = (x * 100) + (y * 100);
  print(answer2); // 5600

  // 3
  const answer3 = (x * 100) + (y / 10);
  print(answer3); // 4601.0

  /// Challenge 4: Average rating
  ///
  /// Declare three constants called `rating1`, `rating2` and `rating3` of
  /// type `double` and assign each a value. Calculate the average of the
  /// three and store the result in a constant named `averageRating`.
  /// 課題 4: 平均評価
  ///
  /// `double` 型の `rating1`、`rating2`、`rating3` という 3 つの定数を宣言し、
  /// それぞれに値を割り当てます。3 つの平均を計算し、その結果を `averageRating`
  /// という定数に格納します。

  const rating1 = 7.9;
  const rating2 = 6.5;
  const rating3 = 10.0;
  const averageRating = (rating1 + rating2 + rating3) / 3;
  print(averageRating);

  /// Challenge 5: Quadratic equations
  ///
  /// A quadratic equation is something of the form
  ///
  /// `a⋅x² + b⋅x + c = 0`.
  ///
  /// The values of `x` which satisfy this can be solved by using the equation
  ///
  /// `x = (-b ± sqrt(b² - 4⋅a⋅c)) / (2⋅a)`.
  ///
  /// Declare three constants named `a`, `b` and `c` of type `double`. Then
  /// calculate the two values for `x` using the equation above (noting that
  /// the `±` means plus or minus, so one value of `x` for each). Store the
  /// results in constants called `root1` and `root2` of type `double`.
  /// 課題 5: 二次方程式
  ///
  /// 二次方程式は、次のような形式です
  ///
  /// `a⋅x² + b⋅x + c = 0`。
  ///
  /// これを満たす `x` の値は、次の式を使用して解くことができます
  ///
  /// `x = (-b ± sqrt(b² - 4⋅a⋅c)) / (2⋅a)`。
  ///
  /// `a`、`b`、`c` という名前の 3 つの定数 (`double` 型) を宣言します。次に、
  /// 上記の式を使用して `x` の 2 つの値を計算します (`±` はプラスまたはマイナスを意味するため、
  /// それぞれに `x` の値が 1 つずつあることに注意してください)。結果を、`double` 型の `root1`
  /// および `root2` という名前の定数に格納します。

  const a = 2.0;
  const b = 3.0;
  const c = 1.0;
  final root1 = (-b + sqrt(b * b - 4 * a * c)) / (2 * a);
  final root2 = (-b - sqrt(b * b - 4 * a * c)) / (2 * a);
  print(root1);
  print(root2);
}
