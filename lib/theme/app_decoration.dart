import 'package:flutter/material.dart';
import 'package:tuneinheartapplication/Utilities/color_constant.dart';




class AppDecoration {
  static BoxDecoration get fillGray900 => BoxDecoration(
    color: ColorConstant.gray900,
  );
  static BoxDecoration get fillBlack90001 => BoxDecoration(
    color: ColorConstant.black90001,
  );
  static BoxDecoration get fillPink500 => BoxDecoration(
    color: ColorConstant.pink500,
  );
  static BoxDecoration get fillBlack900 => BoxDecoration(
    color: ColorConstant.black900,
  );
  static BoxDecoration get outlineBluegray800 => BoxDecoration(
    border: Border.all(
      color: ColorConstant.blueGray800,
      width: 2,),
  );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
    color: ColorConstant.whiteA700,
  );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder15 = BorderRadius.circular(15);

  static BorderRadius roundedBorder3 = BorderRadius.circular(3);

  static BorderRadius roundedBorder10 = BorderRadius.circular(10);

  static BorderRadius roundedBorder20 = BorderRadius.circular(20);
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;