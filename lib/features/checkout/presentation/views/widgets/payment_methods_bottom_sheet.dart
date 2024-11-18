import 'package:flutter/material.dart';
import 'package:integration/features/checkout/presentation/views/widgets/payment_methods_list_view.dart';

import '../../../../../core/utils/values_manager.dart';
import 'custom_button_bloc_consumer.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppPadding.p16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: AppSize.s16,
          ),
          PaymentMethodsListView(),
          SizedBox(
            height: AppSize.s32,
          ),
          CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}
