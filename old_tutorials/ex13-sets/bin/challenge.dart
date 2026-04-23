void main() {
  setOperationsExercise();
  intersectionsAndUnions();

  challenge1();
  challenge2();
}

/// Set Operations Exercise
///
/// 1. Create an empty set of type `String`, and name it `animals`.
/// 2. Add three animals to it.
/// 3. Check if the set contains `'sheep'`.
/// 4. Remove one of the animals.
///
/// 集合演算の演習
///
/// 1. `String` 型の空の集合を作成し、`animals` という名前を付けます。
/// 2. これに 3 匹の動物を追加します。
/// 3. 集合に `'sheep'` が含まれているかどうかを確認します。
/// 4. 動物の 1 匹を削除します。
///
void setOperationsExercise() {
  final animals = <String>{};

  animals.add('horse');
  animals.add('cow');
  animals.add('camel');
  print(animals);

  final containsSheep = animals.contains('sheep');
  print(containsSheep);

  animals.remove('cow');
  print(animals);
}

/// Intersections and Unions Exercise
///
/// Find the intersection and union of the following three sets:
///
/// 交差と結合の演習
///
/// 次の 3 つの集合の交差と結合を求めます。
///
/// ```dart
/// final nullSafe = {'Swift', 'Dart', 'Kotlin'};
/// final pointy = {'Sword', 'Pencil', 'Dart'};
/// final dWords = {'Dart', 'Dragon', 'Double'};
/// ```
void intersectionsAndUnions() {
  final nullSafe = {'Swift', 'Dart', 'Kotlin'};
  final pointy = {'Sword', 'Pencil', 'Dart'};
  final dWords = {'Dart', 'Dragon', 'Double'};

  final intersection = nullSafe.intersection(pointy).intersection(dWords);
  final union = nullSafe.union(pointy).union(dWords);

  print(intersection);
  print(union);
}

/// Challenge 1: A Unique Request
///
/// Write a function that takes a paragraph of text and returns a
/// collection of unique String characters that the text contains.
///
/// Hint: Use `String.fromCharCode` to convert a code point back to a string.
///
/// チャレンジ 1: ユニークなリクエスト
///
/// テキストの段落を受け取り、テキストに含まれるユニークな文字列文字のコレクションを返す関数を作成します。
///
/// ヒント: `String.fromCharCode` を使用して、コード ポイントを文字列に戻します。
///
void challenge1() {
  Set<String> uniqueCodePoints(String text) {
    final uniqueCharacters = <String>{};
    for (final codePoint in text.runes) {
      final character = String.fromCharCode(codePoint);
      uniqueCharacters.add(character);
    }
    return uniqueCharacters;
  }

  const paragraphOfText = 'Once upon a time there was a Dart programmer who '
      'had a challenging challenge to solve. Though the challenge was great, '
      'a solution did come. The end.';

  print(uniqueCodePoints(paragraphOfText));
}

/// Challenge 2: Symmetric Difference
///
/// Earlier in the chapter, you found the intersection and the union of the
/// following sets:
///
/// 課題 2: 対称差
///
/// この章の前半で、次の集合の交差と和集合を見つけました。
///
/// ```dart
/// final setA = {8, 2, 3, 1, 4};
/// final setB = {1, 6, 5, 4};
/// ```
///
/// How would you find the set of all values that are unique to each set,
/// that is, everything but the duplicates `1` and `4`:
///
/// 各セットに固有のすべての値のセット、つまり重複する `1` と `4`
/// 以外のすべての値のセットをどのように見つけますか。
///
/// ```text
/// {8, 2, 3, 6, 5}
/// ```
void challenge2() {
  final setA = {8, 2, 3, 1, 4};
  final setB = {1, 6, 5, 4};
  final intersection = setA.intersection(setB);
  final union = setA.union(setB);

  // Calling `toSet` creates a copy of the set.
  final symmetricDifference = union.toSet();
  for (int element in intersection) {
    symmetricDifference.remove(element);
  }
  print(symmetricDifference);
}
