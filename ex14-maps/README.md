# Lesson 14 — Maps

> A `Map<K, V>` is a key-value lookup — Dart's associative array.

## The story

```dart
final person = {
  'name': 'Ada',
  'city': 'London',
};

person['city'] = 'Bletchley';            // set
person['profession'] = 'mathematician';  // add

for (final entry in person.entries) {
  print('${entry.key}: ${entry.value}');
}

person.length;     // 3
person.values;     // Iterable of values
person.keys;       // Iterable of keys
```

## Your mission

Implement four helpers in `lib/ex14_maps.dart`:

1. `personInfo()` — a literal `Map<String, String>`.
2. `updateCity(m, city)` — returns a **new** map, doesn't mutate.
3. `countKeys(m)` — wraps `.length`.
4. `valuesOf(m)` — wraps `.values.toList()`.

## Run the tests

```bash
cd ex14-maps && dart pub get && dart test
```
