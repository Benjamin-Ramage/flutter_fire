import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire/styles/colors.dart';

abstract class BaseStyles {
  static double get borderRadius => 10.0;

  static double get buttonBorderRadius => 30.0;

  static double get borderWidth => 2.0;

  static double get dropDownWidth => 3.0;

  static double get listFieldHorizontal => 20.0;

  static double get listFieldVertical => 5.0;

  static double get animationOffset => 2.0;

  static EdgeInsets get listPadding {
    return EdgeInsets.symmetric(
      horizontal: BaseStyles.listFieldHorizontal,
      vertical: BaseStyles.listFieldVertical,
    );
  }

  static List<BoxShadow> get boxShadow {
    return [
      BoxShadow(
        color: AppColors.grey.withOpacity(.5),
        offset: const Offset(1.0, 2.0),
        blurRadius: 2.0,
      ),
    ];
  }

  static List<BoxShadow> get boxShadowPressed {
    return [
      BoxShadow(
        color: AppColors.grey.withOpacity(.5),
        offset: const Offset(1.0, 1.0),
        blurRadius: 1.0,
      ),
    ];
  }
}
