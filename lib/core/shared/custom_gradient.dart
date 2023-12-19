import 'package:dc_duhok/core/constant/color.dart';
import 'package:flutter/material.dart';

LinearGradient customGradient() {
  return const LinearGradient(
    colors: [Color(0xffF8F0E5), Color(0xffADC4CE)],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.4, 0.7],
    tileMode: TileMode.repeated,
  );
}

LinearGradient customGradient2() {
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: const [
      0.4,
      0.2,
      0.8,
    ],
    colors: [
      primaryColor,
      AppColor.secondColor,
      AppColor.thirdColor,
    ],
  );
}

LinearGradient deviceOnGradient() {
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: const [
      0.4,
      0.2,
      0.8,
    ],
    colors: [
      primaryColor,
      AppColor.secondColor,
      AppColor.thirdColor,
    ],
  );
}
