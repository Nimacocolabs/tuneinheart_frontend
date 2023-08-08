import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color whiteA7004c = fromHex('#4cffffff');

  static Color cyanA400 = fromHex('#05d8e8');

  static Color blueGray400 = fromHex('#888888');

  static Color gray900 = fromHex('#080833');

  static Color whiteA70033 = fromHex('#33ffffff');

  static Color black90001 = fromHex('#01012a');

  static Color black900 = fromHex('#0a0a0a');

  static Color blueGray800 = fromHex('#32324e');

  static Color pink800 = fromHex('#aa1d4a');

  static Color pink500 = fromHex('#ff296d');

  static Color cyan50 = fromHex('#d1f9ff');

  static Color blueGray900 = fromHex('#26263f');

  static Color cyan900 = fromHex('#005679');

  static Color whiteA700 = fromHex('#ffffff');

  static Color black90002 = fromHex('#000000');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}