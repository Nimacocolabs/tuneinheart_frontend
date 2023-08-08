import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

// This is where the magic happens.
// This functions are responsible to make UI responsive across all the mobile devices.
Size size = WidgetsBinding.instance.window.physicalSize /
    WidgetsBinding.instance.window.devicePixelRatio;

// Caution! If you think these are static values and are used to build a static UI,  you mustn’t.
// These are the Viewport values of your Figma Design.
// These are used in the code as a reference to create your UI Responsively.
const num FIGMA_DESIGN_WIDTH = 414;
const num FIGMA_DESIGN_HEIGHT = 896;
const num FIGMA_DESIGN_STATUS_BAR = 0;

///This method is used to get device viewport width.
get width {
  return size.width;
}

///This method is used to get device viewport height.
get height {
  num statusBar =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).viewPadding.top;
  num bottomBar = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
      .viewPadding
      .bottom;
  num screenHeight = size.height - statusBar - bottomBar;
  return screenHeight;
}

double screenWidth = 0.0;
double screenHeight = 0.0;

String rupeeSymbol = '₹';

void setScreenDimensions(BuildContext context) {
  screenHeight = MediaQuery.of(context).size.height;
  screenWidth = MediaQuery.of(context).size.width;
}

void toastMessage(dynamic message,
    {ToastGravity gravity = ToastGravity.BOTTOM}) {
  log('toast: $message');
  Fluttertoast.showToast(msg: '$message', gravity: gravity);
}

String parseformatDate(var _dt, [String? _format]) {
  var dateformat = new DateFormat(_format);
  DateFormat apidatedateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  try {
    return dateformat.format(apidatedateFormat.parse(_dt));

    // DateFormat(_format).format(DateTime.parse(_dt));
  } catch (e) {
    try {
      return DateFormat(_format).format(DateTime.parse(_dt));
    } catch (e2) {
      return '<ErrDate>';
    }
  }
}
///This method is used to set padding responsively
EdgeInsetsGeometry getPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

///This method is used to set margin responsively
EdgeInsetsGeometry getMargin({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

///This method is used to get padding or margin responsively
EdgeInsetsGeometry getMarginOrPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  if (all != null) {
    left = all;
    top = all;
    right = all;
    bottom = all;
  }
  return EdgeInsets.only(
    left:
    left ?? 0,
    top:
    top ?? 0,
    right:
    right ?? 0,
    bottom:
    bottom ?? 0,
  );
}

// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:intl/intl.dart';
//
//
//
// double screenWidth = 0.0;
// double screenHeight = 0.0;
//
// String rupeeSymbol = '₹';
//
// void setScreenDimensions(BuildContext context) {
//   screenHeight = MediaQuery.of(context).size.height;
//   screenWidth = MediaQuery.of(context).size.width;
// }
//
// void toastMessage(dynamic message,
//     {ToastGravity gravity = ToastGravity.BOTTOM}) {
//   log('toast: $message');
//   Fluttertoast.showToast(msg: '$message', gravity: gravity);
// }
//
// String parseformatDate(var _dt, [String? _format]) {
//   var dateformat = new DateFormat(_format);
//   DateFormat apidatedateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
//
//   try {
//     return dateformat.format(apidatedateFormat.parse(_dt));
//
//     // DateFormat(_format).format(DateTime.parse(_dt));
//   } catch (e) {
//     try {
//       return DateFormat(_format).format(DateTime.parse(_dt));
//     } catch (e2) {
//       return '<ErrDate>';
//     }
//   }
// }
//
// String getDateGap(String dateReceived) {
//   try {
//     DateTime dateTimeCreatedAt = DateTime.parse(dateReceived);
//     DateTime dateTimeNow = DateTime.now();
//     final differenceInDays = dateTimeCreatedAt.difference(dateTimeNow).inDays;
//     print('$differenceInDays');
//     return '$differenceInDays';
//   } catch (e) {
//     return "";
//   }
// }
//
//
// double getFileSizeInMb(File file)  {
//   int sizeInBytes = file.lengthSync();
//   double sizeInMb = sizeInBytes / (1024 * 1024);
//
//   print('${file.path}: $sizeInMb');
//   return sizeInMb;
// }
//
//
// extension ColorExtension on String {
//   toColor() {
//     var hexColor = this.replaceAll("#", "");
//     if (hexColor.length == 6) {
//       hexColor = "FF" + hexColor;
//     }
//     if (hexColor.length == 8) {
//       return Color(int.parse("0x$hexColor"));
//     }
//   }
// }
//