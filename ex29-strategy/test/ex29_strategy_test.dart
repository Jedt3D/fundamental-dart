import 'package:ex29_strategy/ex29_strategy.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 29 — Strategy', () {
    test('CreditCard charges 2.9% + 30¢', () {
      // 2.9% of 10000¢ = 290; + 30 = 320
      expect(CreditCard().fee(10000), equals(320));
    });

    test('PayPal charges 3.4% + 30¢', () {
      // 3.4% of 10000 = 340; + 30 = 370
      expect(PayPal().fee(10000), equals(370));
    });

    test('Crypto charges a flat 1%', () {
      expect(Crypto().fee(10000), equals(100));
      expect(Crypto().fee(50000), equals(500));
    });

    test('Checkout can swap strategies at runtime', () {
      final checkout = Checkout(CreditCard());
      expect(checkout.totalWithFee(10000), equals(10320));

      checkout.setStrategy(Crypto());
      expect(checkout.totalWithFee(10000), equals(10100));
    });
  });
}
