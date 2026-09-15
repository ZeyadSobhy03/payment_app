
import 'package:dio/dio.dart';
import 'package:payment_app/presentation/screens/data/data_source/payment_remote_data_source.dart';

class PaymentApiDataSource implements PaymentRemoteDataSource {
  final Dio dio;

  PaymentApiDataSource({required this.dio});

  static const String _baseUrl = 'https://accept.paymob.com';
  static const String _checkoutUrl = 'https://eg.checkout.paymob.com/';
  static const String _secretKey =
      "..............................";
  static const String _publicKey =
      "...................................................";

  @override
  Future<Map<String, dynamic>> createIntention({
    required num amount,
    required String currency,
    required List<int> paymentMethodTypes,
    required List<Map<String, dynamic>> items,
    required Map<String, dynamic> billingData,
  }) async {
    try {
      final response = await dio.post(
        '$_baseUrl/v1/intention/',
        data: {
          "amount": amount,
          "currency": currency,
          "payment_methods": paymentMethodTypes,
          "items": items,
          "billing_data": billingData,
        },
        options: Options(
          headers: {
            'Authorization': 'Token $_secretKey',
            'Content-Type': 'application/json',
          },
        ),
      );


      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  String getCheckoutUrl({required String clientSecret}) {
    return '$_checkoutUrl/?publicKey=$_publicKey&clientSecret=$clientSecret';
  }

  @override
  Future<String> getPaymentCheckoutUrl({
    required num amount,
    required String currency,
    required List<int> paymentMethodTypes,
    required List<Map<String, dynamic>> items,
    required Map<String, dynamic> billingData,
  }) async {
    final intention = await createIntention(
      amount: amount,
      currency: currency,
      paymentMethodTypes: paymentMethodTypes,
      items: items,
      billingData: billingData,
    );

    final clientSecret = intention['client_secret'] as String;
    return getCheckoutUrl(clientSecret: clientSecret);
  }
}
