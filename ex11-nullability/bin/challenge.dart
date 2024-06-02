void main() {
  nullOverviewExercise1();
  nullOverviewExercise2();
  nullOverviewExercise3();

  challenge1();
}

/// Null Overview: Exercise 1
///
/// Create a `String?` variable called `profession`, but don't give it a value.
/// Then you'll have `profession` `null`. Get it?

/// Null の概要: 演習 1
///
/// `profession` という `String?` 変数を作成しますが、値を指定しません。
/// すると、`p​​rofession` は `null` になります。わかりますか?
///
void nullOverviewExercise1() {
  String? profession;
  print(profession);
}

/// Null Overview: Exercise 2
///
/// Give `profession` a value of "basketball player".
///
/// Null 概要: 演習 2
///
/// `profession` に「バスケットボール選手」という値を設定します。
///
void nullOverviewExercise2() {
  String? profession;
  profession = 'basketball player';
  print(profession);
}

/// Null Overview: Exercise 3
///
/// Write the following line and then hover your cursor over the variable
/// name. What type does Dart infer `iLove` to be? `String` or `String?`?
///
/// Null の概要: 演習 3
///
/// 次の行を記述し、カーソルを変数名の上に置きます。 Dart は `iLove` をどの型と推測しますか? `String` ですか、それとも `String?` ですか?
///
/// ```
/// const iLove = 'Dart';
/// ```
void nullOverviewExercise3() {
  const iLove = 'Dart';
  print(iLove.runtimeType);
  // `iLove` is of type String (non-nullable).
}

/// Challenge 1: Naming Customs
///
/// People around the world have different customs for giving names to
/// children. It would be difficult to create a data class to accurately
/// represent them all, but try it like this:
///
/// - Create a class called `Name` with `givenName` and `surname` properties.
/// - Some people write the surname last and some write it first. Add a
///   Boolean property called `surnameIsFirst` to keep track of this.
/// - Not everyone in the world has a surname.
/// - Add a `toString` method that prints the full name.
///
/// 課題 1: 命名の習慣
///
/// 世界中の人々は、子供に名前を付ける習慣が異なります。 すべてを正確に表すデータ クラスを作成するのは難しいでしょうが、次のように試してください。
///
/// - `givenName` プロパティと `surname` プロパティを持つ `Name` というクラスを作成します。
/// - 姓を最後に書く人もいれば、最初に書く人もいます。 これを把握するために、`surnameIsFirst` というブール型プロパティを追加します。
/// - 世界中のすべての人が姓を持っているわけではありません。
/// - フルネームを出力する `toString` メソッドを追加します。
///
void challenge1() {
  final ray = Name(givenName: 'Ray', surname: 'Wenderlich');
  final liMing = Name(surname: 'Li', givenName: 'Ming', surnameIsFirst: true);
  final baatar = Name(givenName: 'Baatar');

  print(ray);
  print(liMing);
  print(baatar);
}

class Name {
  Name({
    required this.givenName,
    this.surname,
    this.surnameIsFirst = false,
  });

  final String givenName;
  final String? surname;
  final bool surnameIsFirst;

  @override
  String toString() {
    if (surname == null) {
      return givenName;
    }
    if (surnameIsFirst) {
      return '$surname $givenName';
    }
    return '$givenName $surname';
  }
}
