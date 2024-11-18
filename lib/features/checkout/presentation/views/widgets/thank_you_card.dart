import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:integration/features/checkout/presentation/views/widgets/card_info_widget.dart';
import 'package:integration/features/checkout/presentation/views/widgets/payment_item_info.dart';
import 'package:integration/features/checkout/presentation/views/widgets/total_price.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/font_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.whiteOpacity,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 50 + 16,
          left: 22,
          right: 22,
        ),
        child: Column(
          children: [
            Text(
              AppStrings.thankYou,
              style: getMediumStyle(
                color: ColorManager.black,
                fontSize: FontSize.s25,
              ),
            ),
            Text(
              AppStrings.transactionSuccessful,
              style: getRegularStyle(
                color: ColorManager.blackWith8Opacity,
                fontSize: FontSize.s18,
              ),
            ),
            const SizedBox(
              height: AppSize.s24,
            ),
            const PaymentItemInfo(
              title: AppStrings.date,
              value: '01/24/2023',
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            const PaymentItemInfo(
              title: AppStrings.time,
              value: '10:15 AM',
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            const PaymentItemInfo(
              title: AppStrings.to,
              value: AppStrings.samLouis,
            ),
            Divider(
              height: AppSize.s40,
              thickness: 2,
              color: ColorManager.lightGrey,
            ),
            const TotalPrice(
              value: '50.97',
            ),
            const CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  CupertinoIcons.barcode,
                  size: 91,
                ),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    color: ColorManager.whiteOpacity,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.50,
                        color: ColorManager.green,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.paid,
                      style: getSemiBoldStyle(
                        color: ColorManager.green,
                        fontSize: FontSize.s24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: (MediaQuery.sizeOf(context).height * 0.2 + 20) / 4,
            ),
          ],
        ),
      ),
    );
  }
}
