import 'package:payment_app/presentation/screens/data/data_source/payment_remote_data_source.dart';
import 'package:payment_app/presentation/screens/data/repositories/payment_repositories.dart';

class PaymentRepositoriesImp implements PaymentRepositories{
  final PaymentRemoteDataSource remoteDataSource;
  PaymentRepositoriesImp({required this.remoteDataSource});

  @override
  Future<Map<String, dynamic>> createIntention({required num amount, required String currency, required List<int> paymentMethodTypes, required List<Map<String, dynamic>> items, required Map<String, dynamic> billingData,}) {
    return remoteDataSource.createIntention(
      amount: amount,
      currency: currency,
      paymentMethodTypes: paymentMethodTypes,
      items: items,
      billingData: billingData
    );
  }

  @override
  String getCheckoutUrl({required String clientSecret}) {
    return remoteDataSource.getCheckoutUrl(clientSecret: clientSecret);
  }

  @override
  Future<String> getPaymentCheckoutUrl({required num amount, required String currency, required List<int> paymentMethodTypes, required List<Map<String, dynamic>> items, required Map<String, dynamic> billingData,}) {
    return remoteDataSource.getPaymentCheckoutUrl(
      amount: amount,
      currency: currency,
      paymentMethodTypes: paymentMethodTypes,
      items: items,
      billingData: billingData,
    );
  }

}