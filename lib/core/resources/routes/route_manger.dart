import 'package:flutter/material.dart';
import 'package:payment_app/presentation/screens/presentation/view/payment_screen.dart';

class RouteManger {
  static const String paymentScreen = "/";

 static Route router(RouteSettings settings) {
    switch (settings.name) {
      case paymentScreen:
        return MaterialPageRoute(builder: (context) => PaymentScreen());

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(body: Center(child: Text("No Route Found")));
          },
        );
    }
  }
}
