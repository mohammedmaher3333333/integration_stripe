import 'package:flutter/material.dart';
import 'package:integration/core/utils/color_manager.dart';
import 'package:integration/core/utils/values_manager.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: AppSize.s2,
      color: ColorManager.lightGrey,
    );
  }
}
