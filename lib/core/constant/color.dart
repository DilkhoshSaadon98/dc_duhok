import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:flutter/material.dart';

Color primaryColor = const Color(0xff133E58);
Color cartBackgroundColor = const Color(0xFF252B48);
Color darkBackgroundColor = const Color.fromARGB(255, 10, 12, 22);
const Color grey = Color(0xff8e8e8e);
const Color grey2 = Color.fromARGB(255, 66, 66, 66);
const Color black = Color(0xff000000);
const Color white = Color(0xffffffff);
// static const Color primaryColor = Color(0xff5DB1DF);
const Color backgroundcolor = Color.fromARGB(255, 238, 144, 144);
// const Color primaryColor = Color(0xff133E58);
//static const Color secondColor = Color.fromARGB(255, 62, 145, 145);
const Color secondColor = Color(0xfff5b31a);
const Color fourthColor = Color(0xff0d3056);
const Color thirdColor = Color.fromARGB(255, 255, 179, 170);

Color darkCardColor = const Color(0xff03001C);
Color cartColor = myServices.sharedPreferences.getBool('mode') == true
    ? cartColor = darkCardColor
    : cartColor = white;
// ignore: constant_identifier_names

class AppColor {
  static const Color grey = Color(0xff8e8e8e);
  static const Color grey2 = Color.fromARGB(255, 66, 66, 66);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffffffff);
  // static const Color primaryColor = Color(0xff5DB1DF);
  static const Color backgroundcolor = Color(0xffffffff);
  // static const Color primaryColor = Color(0xff133E58);
  //static const Color secondColor = Color.fromARGB(255, 62, 145, 145);
  static const Color secondColor = Color(0xfff5b31a);
  static const Color fourthColor = Color(0xff0d3056);
  static const Color thirdColor = Color.fromARGB(255, 182, 55, 41);
}
