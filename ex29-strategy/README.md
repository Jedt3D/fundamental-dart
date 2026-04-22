# Lesson 29 — Strategy pattern

> "Here are three ways to compute the fee — pick one at runtime."

## The story

```dart
abstract class PaymentStrategy {
  int fee(int amountCents);
}

class CreditCard implements PaymentStrategy {
  @override
  int fee(int amount) => (amount * 0.029).round() + 30;
}

class Checkout {
  Checkout(this._strategy);
  PaymentStrategy _strategy;
  void setStrategy(PaymentStrategy s) { _strategy = s; }
  int totalWithFee(int amount) => amount + _strategy.fee(amount);
}
```

## Your mission

Implement all three strategies and `Checkout.setStrategy` in
`lib/ex29_strategy.dart`.

## Run the tests

```bash
cd ex29-strategy && dart pub get && dart test
```
