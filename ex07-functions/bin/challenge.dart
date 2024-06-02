import 'dart:math';

void main(List<String> arguments) {
  functionBasicsExercise1();
  functionBasicsExercise2();
  functionBasicsExercise3();

  challenge1();
  challenge2();
}

/// Function basics: Exercise 1
///
/// Write a function named `youAreWonderful` with a string parameter
/// called `name`. It should return a string using `name`, and say something
/// like "You're wonderful, Bob."
///
/// 関数の基本: 演習 1
///
/// `name` という文字列パラメータを持つ `youAreWonderful` という関数を作成します。この関数は
/// `name` を使用して文字列を返し、次のような内容を表示します。
/// 「ボブ、素晴らしいですね。」
///
void functionBasicsExercise1() {
  String youAreWonderful(String name) {
    return "You're wonderful, $name.";
  }

  print(youAreWonderful('Bob'));
}

/// Function basics: Exercise 2
///
/// Add another `int` parameter called `numberPeople` so that the
/// function returns something like "You're wonderful, Bob. 10 people
/// think so."
///
/// 関数の基本: 演習 2
///
/// `numberPeople` という別の `int` パラメータを追加して、
/// 関数が「ボブ、あなたは素晴らしいです。10 人がそう思っています。」のような結果を返すようにします。
///
void functionBasicsExercise2() {
  String youAreWonderful(String name, int numberPeople) {
    return "You're wonderful, $name. $numberPeople people think so.";
  }

  print(youAreWonderful('Bob', 10));
}

/// Function basics: Exercise 3
///
///  Make both inputs named parameters. Make `name` required and
///  set `numberPeople` to have a default of `30`.
///
/// 関数の基本: 演習 3
///
/// 両方の入力を名前付きパラメータにします。`name` を必須にし、
/// `numberPeople` のデフォルトを `30` に設定します。
///
void functionBasicsExercise3() {
  String youAreWonderful({
    required String name,
    int numberPeople = 30,
  }) {
    return "You're wonderful, $name. $numberPeople people think so.";
  }

  print(youAreWonderful(name: 'Mary'));
}

/// Challenge 1: Circular Area
///
/// Write a function that tells you the area of a circle based on some input
/// radius. If you recall from geometry class, you can find the area of a
/// circle by multiplying pi times the radius squared.
///
/// チャレンジ 1: 円の面積
///
/// 入力された半径に基づいて円の面積を返す関数を作成します。幾何学の授業で習ったように、
/// 円の面積は円周率に半径の 2 乗を掛けることで求められます。
///
void challenge1() {
  // pi is in the dart:math library.
  double areaCircle(double radius) {
    return pi * radius * radius;
  }

  final result = areaCircle(3);
  print(result);
}

/// Challenge 2: Prime Time
///
/// Write a function that checks if a number is prime.
///
/// First, write a function with the following signature to determine if one
/// number is divisible by another:
///
/// チャレンジ 2: 素数タイム
///
/// 数が素数かどうかをチェックする関数を記述します。
//
/// まず、ある数が別の数で割り切れるかどうかを判定する次のシグネチャを持つ関数を記述します。
///
/// ```
/// bool isNumberDivisible(int number, int divisor)
/// ```
///
/// The modulo operator `%` will help with that.
/// Then, write the function that returns `true` if prime and `false` otherwise:
///
/// モジュロ演算子 `%` が役立ちます。
/// 次に、素数の場合は `true` を返し、そうでない場合は `false` を返す関数を記述します。
///
/// ```
/// bool isPrime(int number)
/// ```
///
/// A number is prime if it's only divisible by 1 and itself. Loop through the
/// numbers from 1 to the number and find the number's divisors. If it has any
/// divisors other than 1 and itself, it's not prime.
///
/// Check the following cases:
///
/// ある数が 1 とそれ自身でしか割り切れない場合、その数は素数です。1 からその数までの数をループし、
/// その数の約数を見つけます。1 とそれ自身以外の約数がある場合、その数は素数ではありません。
///
/// 次のケースを確認してください。
///
/// ```dart
/// isPrime(6); // false
/// isPrime(13); // true
/// isPrime(8893); // true
/// ```
///
/// Here are a few more hints:
///
/// - Numbers less than zero are not considered prime.
/// - Use a `for` loop to look for divisors. You can start at 2 and if you
/// end before the number, return false.
/// - If you're clever, you can loop from 2 until you reach the square root
/// of the number. Add the following import to the top of the file to access
/// the `sqrt` function:
///
/// ここにさらにいくつかのヒントがあります:
///
/// - 0 未満の数は素数とは見なされません。
/// - `for` ループを使用して約数を検索します。2 から開始し、その数より前に終了した場合は false
/// を返します。
/// - 賢い人は、2 から数の平方根に達するまでループできます。ファイルの先頭に次のインポートを追加して、
/// `sqrt` 関数にアクセスします:
///
/// ```dart
/// import 'dart:math';
/// ```
void challenge2() {
  bool isNumberDivisible(int number, int divisor) => number % divisor == 0;

  bool isPrime(int number) {
    for (var i = 2; i <= sqrt(number); i++) {
      if (isNumberDivisible(number, i)) {
        return false;
      }
    }
    return true;
  }

  print(isPrime(6));
  print(isPrime(13));
  print(isPrime(8893));
}
