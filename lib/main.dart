import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'core/utils/api_keys.dart';
import 'core/utils/color_manager.dart';
import 'features/checkout/presentation/views/my_cart_view.dart';

void main()async {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorManager.white,
      ),
      home: const MyCartView(),
    );
  }
}

// 1. paymentIntentObject = create payment intent (amount,currency)
// 2. initialize the payment sheet(paymentIntentClientSecret)
// 3. present paymentSheet()
        // if i want save card details
// we can add customerID to payment intent (amount,currency,customerID)
// create  EphemeralKeySecret = EphemeralKey(stripeVersion, customerID)
// 2. initialize the payment sheet(paymentIntentClientSecret, merchantDisplayName, EphemeralKeySecret)
// 3. present paymentSheet()
