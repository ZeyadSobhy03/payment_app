import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_case/payment_use_case.dart';



class PaymentCubit extends Cubit<PaymentState> {
  final PaymentUseCase paymentUseCase;

  PaymentCubit({required this.paymentUseCase}) : super(PaymentInitial());

  Future<void> startPayment({
    required num amount,
    required String currency,
    required List<int> paymentMethodTypes,
    required List<Map<String, dynamic>> items,
    required Map<String, dynamic> billingData,
  }) async {
    emit(PaymentLoading());
    try {
      final checkoutUrl = await paymentUseCase.getPaymentCheckoutUrl(
        amount: amount,
        currency: currency,
        paymentMethodTypes: paymentMethodTypes,
        items: items,
        billingData: billingData
      );
      emit(PaymentSuccess(checkoutUrl: checkoutUrl));
    } catch (e) {
      emit(PaymentFailure(message: e.toString()));
    }
  }
}
sealed class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentSuccess extends PaymentState {
  final String checkoutUrl;

  PaymentSuccess({required this.checkoutUrl});
}

class PaymentFailure extends PaymentState {
  final String message;

  PaymentFailure({required this.message});
}