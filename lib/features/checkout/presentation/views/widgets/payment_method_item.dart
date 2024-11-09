import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/color_manager.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    this.isActive = false,
    required this.image,
  });

  final bool isActive;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: 103,
      height: 62,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1.5,
          color:
              isActive ? ColorManager.green : ColorManager.blackWith50Opacity,
        ),
        boxShadow: [
          BoxShadow(
            color: isActive ? ColorManager.green : ColorManager.white,
            offset: const Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: SvgPicture.asset(
          image,
        ),
      ),
    );
  }
}
