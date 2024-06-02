void main() {
  /// While-Loops Exercise
  ///
  /// - Create a variable named `counter` and set it equal to `0`.
  /// - Create a `while` loop with the condition `counter < 10`.
  /// - The loop body should print out "counter is X" (where X is replaced
  ///   with the value of `counter`) and then increment `counter` by 1.
  ///
  /// while ループの演習
  ///
  /// - `counter` という名前の変数を作成し、それを `0` に設定します。
  /// - 条件 `counter < 10` で `while` ループを作成します。
  /// - ループ本体は "counter is X" (ここで、X は `counter` の値に置き換えられます) を出力し、
  /// `counter` を 1 増加させます。

  var counter = 0;
  while (counter < 10) {
    print('counter is $counter');
    counter++;
  }

  /// For-Loops Exercise
  ///
  /// Write a `for` loop starting at `1` and ending with `10` inclusive. Print
  /// the square of each number.
  ///
  /// For ループの演習
  ///
  /// `1` から始まり `10` で終わる `for` ループを記述します。
  /// 各数値の 2 乗を出力します。

  for (var i = 1; i <= 10; i++) {
    print(i * i);
  }

  /// Challenge 1: Next Power of Two
  ///
  /// Given a number, determine the next power of two above or equal to
  /// that number.
  ///
  /// チャレンジ 1: 次の 2 の累乗
  ///
  /// 数値が与えられた場合、その数値より大きいか等しい次の 2 の累乗を判定します。

  const number = 946;
  var trial = 1;
  var times = 0;
  while (trial < number) {
    trial = trial * 2;
    times += 1;
  }
  print('Next power of 2 >= $number is $trial '
      'which is 2 to the power of $times.');
  // Next power of 2 >= 946 is 1024 which is 2 to the power of 10.

  /// Challenge 2: Fibonacci
  ///
  /// Calculate the nth Fibonacci number. Remember that Fibonacci numbers
  /// start its sequence with 1 and 1, and then subsequent numbers in the
  /// sequence are equal to the previous two values added together. You can
  /// get a refresher here: https://en.wikipedia.org/wiki/Fibonacci_number
  ///
  /// チャレンジ 2: フィボナッチ
  ///
  /// n 番目のフィボナッチ数を計算します。フィボナッチ数は 1 と 1 で始まり、その後の数は前の 2
  /// つの値を足したものに等しいことに注意してください。復習するには、こちらを参照してください:
  /// https://en.wikipedia.org/wiki/Fibonacci_number

  const n = 10;
  var current = 1;
  var previous = 1;
  var done = 2;
  while (done < n) {
    final next = current + previous;
    previous = current;
    current = next;
    done += 1;
  }
  print('Fibonacci number $n is $current.');
  // Fibonacci number 10 is 55.

  /// Challenge 3: How Many Times?
  ///
  /// In the following `for` loop, what will be the value of sum, and how many
  /// iterations will happen?
  ///
  /// チャレンジ 3: 何回?
  ///
  /// 次の `for` ループでは、合計の値はいくらになり、何回繰り返しが行われますでしょうか?
  ///
  /// ```
  /// var sum = 0;
  /// for (var i = 0; i <= 5; i++) {
  ///   sum += i;
  /// }
  /// ```

  var sum = 0;
  var count = 0;
  for (var i = 0; i <= 5; i++) {
    sum += i;
    count++;
  }
  print('The value of the sum is $sum after $count iterations.');
  // The value of the sum is 15 after 6 iterations.

  /// Challenge 4: The Final Countdown
  ///
  /// Print a countdown from 10 to 0.
  ///
  /// チャレンジ 4: 最終カウントダウン
  ///
  /// 10 から 0 までのカウントダウンを出力します。

  for (var i = 10; i >= 0; i--) {
    print(i);
  }

  /// Challenge 5: Print a Sequence
  ///
  /// Print the sequence 0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0.
  ///
  /// チャレンジ 5: シーケンスを印刷する
  ///
  /// シーケンス 0.0、0.1、0.2、0.3、0.4、0.5、0.6、0.7、0.8、0.9、1.0 を印刷します。

  print('0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0');
  // Just kidding. :]
  // Here's one of several other ways to do it:
  // 冗談です。😆
  // 他にもいくつか方法がありますが、そのうちの 1 つを次に示します。
  for (var i = 0; i <= 10; i++) {
    print(i / 10);
  }
}
