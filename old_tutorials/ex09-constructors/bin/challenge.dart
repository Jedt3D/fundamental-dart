void main() {
  constructorsExercise();
  challenge1();
}

/// Constructors Exercise
///
/// Given the following class:
///
/// ```
/// class PhoneNumber {
///   String value = '';
/// }
/// ```
///
/// 1. Make `value` a `final` variable, but not private.
/// 2. Add a `const` constructor as the only way to initialize a
/// `PhoneNumber` object.
///
/// コンストラクターの演習
///
/// 次のクラスがあるとします:
///
/// ```
/// class PhoneNumber {
/// String value = '';
/// }
/// ```
///
/// 1. `value` を `final` 変数にしますが、プライベートにしないでください。
/// 2. `PhoneNumber` オブジェクトを初期化する唯一の方法として、`const` コンストラクターを追加します。
///
void constructorsExercise() {
  final number = PhoneNumber('555-2121');
  print(number.value);
}

class PhoneNumber {
  const PhoneNumber(this.value);
  final String value;
}

/// Challenge 1: Bert and Ernie
///
/// Create a `Student` class with final `firstName` and `lastName`
/// string properties and a variable `grade` as an `int` property.
/// Add a constructor to the class that initializes all the properties.
/// Add a method to the class that nicely formats a `Student` for printing.
/// Use the class to create students `bert` and `ernie` with grades of 95 and
/// 85, respectively.
///
/// チャレンジ 1: Bert と Ernie
///
/// 最終的な `firstName` と `lastName`
/// 文字列プロパティと `int` プロパティとしての変数 `grade` を持つ `Student` クラスを作成します。
/// すべてのプロパティを初期化するコンストラクターをクラスに追加します。
/// 印刷用に `Student` を適切にフォーマットするメソッドをクラスに追加します。
/// このクラスを使用して、成績がそれぞれ 95 と 85 の学生 `bert` と `ernie` を作成します。
///
///
void challenge1() {
  final ernie = Student('Ernie', 'Henson', 95);
  final bert = Student('Bert', 'Oz', 85);
  print('$ernie\n$bert');
}

class Student {
  Student(this.firstName, this.lastName, this.grade);

  final String firstName;
  final String lastName;
  int grade;

  @override
  String toString() => '$firstName $lastName: $grade';
}
