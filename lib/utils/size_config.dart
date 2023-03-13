// ignore_for_file: avoid_print

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SizeConfig {
  static double? _screenWidth;
  static double? _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;
  static double? textMultiplier;
  static double? imageSizeMultiplier;
  static double? heightMultiplier;
  static double? widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init() {
    _screenWidth = Get.width;
    _screenHeight = Get.height;
    _blockWidth = _screenWidth! / 100;
    _blockHeight = _screenHeight! / 100;
    textMultiplier = (_screenWidth! / 3.8) / 100;

    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;
  }
}

double cWidth(final double size) {
  return size * SizeConfig.widthMultiplier!;
}

double cHeight(final double size) {
  return size * SizeConfig.heightMultiplier!;
}

EdgeInsets edgeSymHV({final double? h, final double? v}) {
  return EdgeInsets.symmetric(
      horizontal: h == null ? 0 : cWidth(h),
      vertical: v == null ? 0 : cHeight(v));
}

EdgeInsets edgeLTRB(
    {final double? l, final double? t, final double? r, final double? b}) {
  return EdgeInsets.fromLTRB(
      l == null ? 0 : cWidth(l),
      t == null ? 0 : cHeight(t),
      r == null ? 0 : cWidth(r),
      b == null ? 0 : cHeight(b));
}

double cImgSize(final double size) {
  return size * SizeConfig.imageSizeMultiplier!;
}
