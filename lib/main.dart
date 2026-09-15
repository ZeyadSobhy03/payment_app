import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/presentation/payment_app.dart';
import 'package:payment_app/presentation/screens/data/data_source/payment_api_data_source.dart';
import 'package:payment_app/presentation/screens/data/repositories/payment_repositories_imp.dart';
import 'package:payment_app/presentation/screens/domain/use_case/payment_use_case.dart';
import 'package:payment_app/presentation/screens/presentation/view_model/payment_view_model.dart';

void main() {
  final dio = Dio();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PaymentCubit(
            paymentUseCase: PaymentUseCase(
              paymentRepositories: PaymentRepositoriesImp(
                remoteDataSource: PaymentApiDataSource(dio: dio),
              ),
            ),
          ),
        ),
      ],
      child: const PaymentApp(),
    ),
  );
}
