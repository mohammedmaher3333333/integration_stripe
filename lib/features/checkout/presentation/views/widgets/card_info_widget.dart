import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/font_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppMargin.m20,
      ),
      padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p16, horizontal: AppPadding.p22),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          SvgPicture.asset(ImageAssets.mastercardLogo),
          const SizedBox(
            width: AppSize.s23,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${AppStrings.creditCard}\n',
                  style: getRegularStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s18,
                  ),
                ),
                TextSpan(
                  text: AppStrings.mastercard,
                  style: getRegularStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
