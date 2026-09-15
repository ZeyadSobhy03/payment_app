abstract class PaymentRemoteDataSource {
  Future<Map<String, dynamic>> createIntention({
    required num amount,
    required String currency,
    required List<int> paymentMethodTypes,
    required List<Map<String, dynamic>> items,
    required Map<String, dynamic> billingData,

  });

  String getCheckoutUrl({required String clientSecret});

  Future<String> getPaymentCheckoutUrl({
    required num amount,
    required String currency,
    required List<int> paymentMethodTypes,
    required List<Map<String, dynamic>> items,
    required Map<String, dynamic> billingData,

  });


}