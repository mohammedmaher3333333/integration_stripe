import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color, {
  double? height,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    height: height,
    fontFamily: FontConstants.fontPoppins,
  );
}

// regular style

TextStyle getRegularStyle({
  double fontSize = FontSize.s25,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
  );
}

// medium style

TextStyle getMediumStyle({
  double fontSize = FontSize.s25,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
  );
}

// medium style

TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.light,
    color,
  );
}

// bold style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    String font = FontConstants.fontPoppins,
    double? height}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    color,
    height: height,
  );
}

// semibold style

TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s24,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.semiBold,

    color,
  );
}
