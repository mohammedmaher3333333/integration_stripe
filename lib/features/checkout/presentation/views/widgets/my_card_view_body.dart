import 'package:flutter/material.dart';
import 'package:integration/core/widgets/custom_button.dart';
import 'package:integration/core/widgets/custom_divider.dart';
import 'package:integration/features/checkout/presentation/views/widgets/display_orders_image.dart';
import 'package:integration/features/checkout/presentation/views/widgets/order_info_item.dart';
import 'package:integration/features/checkout/presentation/views/widgets/payment_methods_list_view.dart';
import 'package:integration/features/checkout/presentation/views/widgets/total_price.dart';

import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class MyCardViewBody extends StatelessWidget {
  const MyCardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
      ),
      child: Column(
        children: [
          const Expanded(child: DisplayOrdersImage()),
          const OrderInfoItem(
            title: AppStrings.orderSubtotal,
            value: '42.97',
          ),
          const OrderInfoItem(
            title: AppStrings.discount,
            value: '0',
          ),
          const OrderInfoItem(
            title: AppStrings.shipping,
            value: '8',
          ),
          const Padding(
            padding: EdgeInsets.all(AppPadding.p15),
            child: CustomDivider(),
          ),
          const TotalPrice(
            value: '50.97',
          ),
          const SizedBox(height: AppSize.s15),
          CustomButton(
            text: AppStrings.completePayment,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const PaymentDetailsView(),
              //   ),
              // );
              showModalBottomSheet(
                context: context,
                builder: (context) => const PaymentMethodsBottomSheet(),
              );
            },
          ),
          const SizedBox(height: AppSize.s10),
        ],
      ),
    );
  }
}

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
          CustomButton(
            text: AppStrings.continueText,
          ),
        ],
      ),
    );
  }
}
