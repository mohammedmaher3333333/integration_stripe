import 'package:flutter/material.dart';
import 'package:integration/core/utils/color_manager.dart';
import 'package:integration/core/utils/strings_manager.dart';
import 'package:integration/core/utils/styles_manager.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    super.key,
    required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.total,
          style: getSemiBoldStyle(
            color: ColorManager.black,
          ),
        ),
        Text(
          '\$$value',
          style: getSemiBoldStyle(
            color: ColorManager.black,
          ),
        ),
      ],
    );
  }
}
