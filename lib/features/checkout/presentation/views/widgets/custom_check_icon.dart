import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: ColorManager.whiteOpacity,
      child: CircleAvatar(
        radius: 40,
        backgroundColor: ColorManager.green,
        child: SvgPicture.asset(
          ImageAssets.checkIcon,
        ),
      ),
    );
  }
}
