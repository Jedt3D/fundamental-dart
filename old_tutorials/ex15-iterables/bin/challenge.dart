void main() {
  exercise();

  challenge1();
  challenge2();
}

/// Exercise: Operations on Iterables
/// 演習: 反復可能オブジェクトの操作
void exercise() {
  // 1. Create a map of key-value pairs.
  // 1. キーと値のペアのマップを作成します。
  const map = {
    'red': 'FF0000',
    'green': '00FF00',
    'blue': '0000FF',
  };

  // 2. Make a variable named `myIterable` and assign it the `keys` of your map.
  // 2. `myIterable` という名前の変数を作成し、マップの `keys` を割り当てます。
  final myIterable = map.keys;

  // 3. Print the third element.
  // 3. 3 番目の要素を出力します。
  print(myIterable.elementAt(2));

  // 4. Print the first and last elements.
  // 4. 最初の要素と最後の要素を出力します。
  print(myIterable.first);
  print(myIterable.last);

  // 5. Print the length of the iterable.
  // 5. 反復可能オブジェクトの長さを出力します。
  print(myIterable.length);

  // 6. Loop through the iterable with a `for-in` loop.
  // 6. `for-in` ループを使用して反復可能オブジェクトをループします。
  for (final element in myIterable) {
    print(element);
  }
}

/// Challenge 1: Iterating by Hand
///
/// 1. Create a list named `myList` and populate it with four values.
/// 2. Use `myList.iterator` to access the iterator.
/// 3. Manually step through the list using `moveNext`, and print each value
///    using `current`.
///
/// 課題 1: 手作業による反復処理
///
/// 1. `myList` という名前のリストを作成し、4 つの値を入力します。
/// 2. `myList.iterator` を使用して反復子にアクセスします。
/// 3. `moveNext` を使用してリストを手動でステップ実行し、`current` を使用して各値を出力します。
///
void challenge1() {
  const myList = [4, 7, 2, 3];
  final myIterator = myList.iterator;

  print(myIterator.moveNext());
  print(myIterator.current);

  print(myIterator.moveNext());
  print(myIterator.current);

  print(myIterator.moveNext());
  print(myIterator.current);

  print(myIterator.moveNext());
  print(myIterator.current);

  print(myIterator.moveNext());
}

/// Challenge 2: Fibonacci to Infinity
///
/// Create a custom iterable collection that contains all of the
/// Fibonacci numbers. Add an optional constructor parameter that
/// will stop iteration after the nth number.
///
/// チャレンジ 2: フィボナッチから無限大へ
///
/// すべてのフィボナッチ数を含むカスタム反復可能コレクションを作成します。
/// オプションのコンストラクター パラメーターを追加して、n 番目の数以降の反復を停止します。
///
void challenge2() {
  final fibonacciSeries = Fibonacci(10);
  for (int number in fibonacciSeries) {
    print(number);
  }
}

class Fibonacci extends Iterable<int> {
  const Fibonacci([this.n]);
  final int? n;

  @override
  Iterator<int> get iterator => FibonacciIterator(n);
}

class FibonacciIterator implements Iterator<int> {
  FibonacciIterator(this.n);
  final int? n;

  @override
  get current => _current;

  var _current = 0;
  var _previous = 1;
  var _count = 0;

  @override
  bool moveNext() {
    final next = _current + _previous;
    _previous = _current;
    _current = next;
    _count++;

    if (n == null) {
      return true;
    }
    return _count <= n!;
  }
}
