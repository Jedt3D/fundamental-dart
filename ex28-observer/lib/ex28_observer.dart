/// Lesson 28 — Observer pattern.
///
/// A subject keeps a list of observers and calls each of them when
/// something changes. Dart has `Stream`s for this out of the box, but
/// building it by hand is a great way to feel the pattern.

typedef Observer<T> = void Function(T event);

class Subject<T> {
  final List<Observer<T>> _observers = [];

  int get listenerCount => _observers.length;

  /// Register [observer] to receive future events.
  void subscribe(Observer<T> observer) {
    throw UnimplementedError('TODO');
  }

  /// Stop sending events to [observer]. Safe to call with an
  /// observer that isn't registered.
  void unsubscribe(Observer<T> observer) {
    throw UnimplementedError('TODO');
  }

  /// Send [event] to every current observer, in registration order.
  void notify(T event) {
    throw UnimplementedError('TODO');
  }
}
