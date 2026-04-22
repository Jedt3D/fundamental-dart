/// Lesson 29 — Strategy pattern.
///
/// Swap the algorithm at runtime. The caller holds a reference to an
/// abstract strategy; concrete strategies plug in and out.

/// Fee calculator: given an amount in cents, return the fee in cents.
abstract class PaymentStrategy {
  int fee(int amountCents);
}

class CreditCard implements PaymentStrategy {
  /// 2.9% + 30¢
  @override
  int fee(int amountCents) {
    throw UnimplementedError('TODO');
  }
}

class PayPal implements PaymentStrategy {
  /// 3.4% + 30¢
  @override
  int fee(int amountCents) {
    throw UnimplementedError('TODO');
  }
}

class Crypto implements PaymentStrategy {
  /// Flat 1%
  @override
  int fee(int amountCents) {
    throw UnimplementedError('TODO');
  }
}

/// Holds a strategy. You can swap it at runtime.
class Checkout {
  Checkout(this._strategy);
  PaymentStrategy _strategy;

  void setStrategy(PaymentStrategy s) {
    throw UnimplementedError('TODO');
  }

  int totalWithFee(int amountCents) {
    throw UnimplementedError('TODO');
  }
}
