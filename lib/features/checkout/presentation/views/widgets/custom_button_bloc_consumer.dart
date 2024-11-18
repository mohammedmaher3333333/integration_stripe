import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration/core/widgets/custom_button.dart';
import 'package:integration/features/checkout/data/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:integration/features/checkout/presentation/manager/stripe_payment_cubit/stripe_payment_cubit.dart';
import 'package:integration/features/checkout/presentation/views/thank_you_view.dart';

import '../../../../../core/utils/strings_manager.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const ThankYouView(),
            ),
          );
        }
        if (state is StripePaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(amount: '100', currency: 'USD', customerId: 'cus_REhgjZsQaBMPCl');
            BlocProvider.of<StripePaymentCubit>(context)
                .makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
          isLoading: state is StripePaymentLoading ? true : false,
          text: AppStrings.continueText,
        );
      },
    );
  }
}
