import '../../data/repositories/payment_repositories.dart';

class PaymentUseCase {
  final PaymentRepositories paymentRepositories;

  PaymentUseCase({required this.paymentRepositories});

  Future<Map<String, dynamic>> createIntention({
    required num amount,
    required String currency,
    required List<int> paymentMethodTypes,
    required List<Map<String, dynamic>> items,
    required Map<String, dynamic> billingData,
  }) {
    return paymentRepositories.createIntention(
      amount: amount,
      currency: currency,
      paymentMethodTypes: paymentMethodTypes,
      items: items,
      billingData: billingData
    );
  }

  String getCheckoutUrl({required String clientSecret}) {
    return paymentRepositories.getCheckoutUrl(clientSecret: clientSecret);
  }

  Future<String> getPaymentCheckoutUrl({
    required num amount,
    required String currency,
    required List<int> paymentMethodTypes,
    required List<Map<String, dynamic>> items,
    required Map<String, dynamic> billingData,
  }) {
    return paymentRepositories.getPaymentCheckoutUrl(
      amount: amount,
      currency: currency,
      paymentMethodTypes: paymentMethodTypes,
      items: items,
      billingData: billingData,
    );
  }
}
