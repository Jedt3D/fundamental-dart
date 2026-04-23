/// Lesson 35 — Dependency Inversion Principle.
///
/// *High-level modules should not depend on low-level modules. Both
/// should depend on abstractions.*
///
/// Anti-pattern: `NotificationService` directly instantiates a
/// `SmtpClient`. Now you can't send via SMS, and you can't test
/// without a real mail server.
///
/// Fix: `NotificationService` depends on a `MessageSender` interface.
/// Concrete senders are injected through the constructor.

abstract class MessageSender {
  void send(String to, String body);
}

class EmailSender implements MessageSender {
  final List<String> sent = [];
  @override
  void send(String to, String body) {
    throw UnimplementedError("TODO: add 'EMAIL|<to>|<body>' to sent");
  }
}

class SmsSender implements MessageSender {
  final List<String> sent = [];
  @override
  void send(String to, String body) {
    throw UnimplementedError("TODO: add 'SMS|<to>|<body>' to sent");
  }
}

/// High-level module — depends only on the abstraction.
class NotificationService {
  NotificationService(this._sender);
  final MessageSender _sender;

  void notify(String to, String body) {
    throw UnimplementedError('TODO: delegate to _sender.send(to, body)');
  }
}
