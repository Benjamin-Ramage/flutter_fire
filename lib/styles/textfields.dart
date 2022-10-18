
import 'package:flutter/material.dart';
import 'package:flutter_fire/styles/text.dart';

import 'base.dart';
import 'colors.dart';


abstract class TextFieldStyles {
  static double get textBoxHorizontal => BaseStyles.listFieldHorizontal;

  static double get textBoxVertical => BaseStyles.listFieldVertical;

  static TextStyle get text => TextStyles.body;

  static TextStyle get forgot => TextStyles.forgotPassword;

  static TextStyle get placeholder => TextStyles.suggestion;

  static Color get cursorColor => AppColors.red;

  static TextAlign get textAlign => TextAlign.start;

  static InputDecoration emailDecoration(hintText) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(20.0),
      hintText: hintText,
      hintStyle: TextFieldStyles.forgot,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.black, width: BaseStyles.borderWidth),
        borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.black, width: BaseStyles.borderWidth),
        borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
        BorderSide(color: AppColors.black, width: BaseStyles.borderWidth),
        borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide:
        BorderSide(color: AppColors.red, width: BaseStyles.borderWidth),
        borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
      ),
    );
  }
}