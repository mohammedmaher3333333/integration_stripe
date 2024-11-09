import 'package:flutter/material.dart';
import 'package:integration/core/utils/color_manager.dart';
import 'package:integration/core/utils/font_manager.dart';
import 'package:integration/core/utils/styles_manager.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({super.key, required this.title, required this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: getRegularStyle(
            color: ColorManager.black,
            fontSize: FontSize.s18,
          ),
        ),
        Text(
          '\$$value',
          style: getRegularStyle(
            color: ColorManager.black,
            fontSize: FontSize.s18,
          ),
        ),
      ],
    );
  }
}
