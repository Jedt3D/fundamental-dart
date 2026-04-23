void main() {
  challenge1();
}

/// Challenge 1: Rectangles
///
/// - Create a class named `Rectangle` with properties for `_width` and
///   `_height`.
/// - Add getters named `width` and `height`.
/// - Add setters for these properties that ensure you can't give negative
///   values.
/// - Add a getter for a calculated property named `area` that returns the area
///   of the rectangle.
///
/// 課題 1: 長方形
///
/// - `_width` と `_height` のプロパティを持つ `Rectangle` というクラスを作成します。
/// - `width` と `height` という getter を追加します。
/// - これらのプロパティに setter を追加して、負の値を渡すことができないようにします。
/// - 長方形の面積を返す `area` という計算プロパティの getter を追加します。
///
///
void challenge1() {
  final rectangle = Rectangle()
    ..width = 2.3
    ..height = 4.0;
  print('width: ${rectangle.width}');
  print('height: ${rectangle.height}');
  print('area: ${rectangle.area}');
}

class Rectangle {
  double _width = 0;
  double _height = 0;

  double get width => _width;
  set width(double value) {
    if (value < 0) {
      print('width must be positive!');
    } else {
      _width = value;
    }
  }

  double get height => _height;
  set height(double value) {
    if (value < 0) {
      print('height must be positive!');
    } else {
      _height = value;
    }
  }

  double get area => _width * _height;
}
