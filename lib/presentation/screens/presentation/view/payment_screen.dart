
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/resources/colors/color_manger.dart';
import 'package:payment_app/presentation/screens/presentation/view/payment_web_view_screen.dart';

import '../view_model/payment_view_model.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.primary,
      appBar: AppBar(
        backgroundColor: ColorsManger.primary,
        elevation: 0,
        title: const Text(
          'Proceed to Payment',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
            if (state is PaymentSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PaymentWebViewScreen(url: state.checkoutUrl),
                ),
              );
            } else if (state is PaymentFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            final isLoading = state is PaymentLoading;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Amount',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$120.00',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              context.read<PaymentCubit>().startPayment(
                                amount: 12000,
                                currency: 'EGP',
                                paymentMethodTypes: [ 5578214],

                                items: const [
                                  {
                                    'name': 'Product 1',
                                    'amount': 6000,
                                    'quantity': 1,
                                  },
                                  {
                                    'name': 'Product 2',
                                    'amount': 6000,
                                    'quantity': 1,
                                  },
                                ],
                                billingData: {
                                  'first_name': 'John',
                                  'last_name': 'Doe',
                                  'email': 'john@example.com',
                                  'phone_number': '+201234567890',
                                },
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: ColorsManger.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: isLoading
                          ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text(
                              'Pay Now by Credit Card',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                        context.read<PaymentCubit>().startPayment(
                          amount: 12000,
                          currency: 'EGP',
                          paymentMethodTypes: [5578214],

                          items: const [
                            {
                              'name': 'Product 1',
                              'amount': 6000,
                              'quantity': 1,
                            },
                            {
                              'name': 'Product 2',
                              'amount': 6000,
                              'quantity': 1,
                            },
                          ],
                          billingData: {
                            'first_name': 'John',
                            'last_name': 'Doe',
                            'email': 'john@example.com',
                            'phone_number': '+201234567890',
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: ColorsManger.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: isLoading
                          ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                          : const Text(
                        'Pay Now by Mobile Wallet',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
