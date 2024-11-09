import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/assets_manager.dart';
import '../utils/color_manager.dart';
import '../utils/font_manager.dart';
import '../utils/styles_manager.dart';

AppBar customAppBar({String? text}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      text ?? '',
      style: getMediumStyle(
        color: ColorManager.black,
        fontSize: FontSize.s25,
      ),
    ),
    leading: Center(
      child: GestureDetector(
        child: SvgPicture.asset(
          ImageAssets.arrowBack,
        ),
      ),
    ),
  );
}
