import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration/core/widgets/custom_button.dart';
import 'package:integration/core/widgets/custom_divider.dart';
import 'package:integration/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:integration/features/checkout/presentation/manager/stripe_payment_cubit/stripe_payment_cubit.dart';
import 'package:integration/features/checkout/presentation/views/widgets/display_orders_image.dart';
import 'package:integration/features/checkout/presentation/views/widgets/order_info_item.dart';
import 'package:integration/features/checkout/presentation/views/widgets/payment_methods_bottom_sheet.dart';
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
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create: (context) =>
                          StripePaymentCubit(CheckoutRepoImpl()),
                      child: const PaymentMethodsBottomSheet(),
                    );
                  });
            },
          ),
          const SizedBox(height: AppSize.s10),
        ],
      ),
    );
  }
}
