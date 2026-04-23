import 'package:ex35_dip/ex35_dip.dart';
import 'package:test/test.dart';

/// A fake sender — the test is the "client" in this case. Because
/// NotificationService depends on the abstraction, we can substitute
/// this freely.
class FakeSender implements MessageSender {
  final List<String> log = [];
  @override
  void send(String to, String body) {
    log.add('FAKE|$to|$body');
  }
}

void main() {
  group('Lesson 35 — DIP', () {
    test('NotificationService delegates to the injected sender', () {
      final fake = FakeSender();
      NotificationService(fake).notify('ada@example.com', 'hello');
      expect(fake.log, equals(['FAKE|ada@example.com|hello']));
    });

    test('swapping to EmailSender just works', () {
      final email = EmailSender();
      NotificationService(email).notify('a@b.com', 'hi');
      expect(email.sent, equals(['EMAIL|a@b.com|hi']));
    });

    test('swapping to SmsSender just works', () {
      final sms = SmsSender();
      NotificationService(sms).notify('+15551234', 'hi');
      expect(sms.sent, equals(['SMS|+15551234|hi']));
    });

    test('NotificationService does not know about concrete senders', () {
      // Same service, different sender types — all compile-time type safe.
      final senders = <MessageSender>[EmailSender(), SmsSender(), FakeSender()];
      for (final s in senders) {
        expect(() => NotificationService(s).notify('to', 'body'),
            returnsNormally);
      }
    });
  });
}
