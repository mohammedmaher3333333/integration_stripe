import 'package:flutter/material.dart';

import '../../../../../core/utils/color_manager.dart';

class CustomDashedLine extends StatelessWidget {
  const CustomDashedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        20,
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 2.0,
              // vertical: 15,
            ),
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                color: ColorManager.lightGrey2,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
