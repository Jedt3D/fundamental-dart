void main() {
  challenge1();
}

/// Challenge 1: Spheres
///
/// Create a `Sphere` class with a `const` constructor that takes a
/// `radius` as a named parameter. Add getters for the volume and
/// surface area but none for the radius. Don't use the `dart:math` package
/// but store your version of `pi` as a `static` constant. Use your class
/// to find the volume and surface area of a sphere with a radius of 12.
///
/// チャレンジ 1: 球体
///
/// 名前付きパラメータとして `radius` を受け取る `const` コンストラクターを持つ `Sphere`
/// クラスを作成します。体積と表面積のゲッターを追加しますが、半径のゲッターは追加しません。
/// `dart:math` パッケージは使用せず、独自の `pi` を `static` 定数として保存します。
/// クラスを使用して、半径が 12 の球体の体積と表面積を求めます。
///
void challenge1() {
  const sphere = Sphere(radius: 12);
  final volume = sphere.volume;
  final area = sphere.area;
  print('volume: $volume, area: $area');
}

class Sphere {
  const Sphere({required int radius}) : _radius = radius;

  final int _radius;

  double get volume => (4 / 3) * pi * _radius * _radius * _radius;
  double get area => 4 * pi * _radius * _radius;

  static const double pi = 3.14159265359;
}
