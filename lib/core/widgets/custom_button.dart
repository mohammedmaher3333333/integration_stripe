import 'package:flutter/material.dart';
import 'package:integration/core/utils/color_manager.dart';
import 'package:integration/core/utils/font_manager.dart';
import 'package:integration/core/utils/styles_manager.dart';
import 'package:integration/core/utils/values_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onTap});

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppSize.s73,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.green,
          borderRadius: BorderRadius.circular(AppSize.s15),
        ),
        child: Center(
            child: Text(
          text,
          style: getMediumStyle(
            color: ColorManager.black,
            fontSize: FontSize.s22,
          ),
        )),
      ),
    );
  }
}
