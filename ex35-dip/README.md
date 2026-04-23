# Lesson 35 — Dependency Inversion Principle (DIP)

> *Depend on abstractions, not concretions.*

## The story

The naive version:

```dart
class NotificationService {
  final smtp = SmtpClient();            // direct, hard dependency
  void notify(String to, String b) => smtp.send(to, b);
}
```

…can't test without a real SMTP server, and can't swap to SMS without
editing the service.

Invert the dependency — inject an abstraction:

```dart
abstract class MessageSender { void send(String to, String body); }

class NotificationService {
  NotificationService(this._sender);
  final MessageSender _sender;
  void notify(String to, String b) => _sender.send(to, b);
}
```

Now email, SMS, and a fake in-memory sender are all swappable with
zero changes to `NotificationService`.

## Your mission

Finish `lib/ex35_dip.dart`. Notice how the test file defines its own
`FakeSender` — that's the testability you gain.

## Run the tests

```bash
cd ex35-dip && dart pub get && dart test
```
