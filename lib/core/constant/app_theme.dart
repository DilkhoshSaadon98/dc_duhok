import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

MyServices myServices = Get.find();
TextStyle get titleStyle {
  return myServices.sharedPreferences.getString('lang') == 'en'
      ? GoogleFonts.barlowCondensed(
          textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: myServices.sharedPreferences.getBool('mode') == true
              ? white
              : primaryColor,
        ))
      : myServices.sharedPreferences.getString('lang') == 'ar'
          ? GoogleFonts.cairo(
              textStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: myServices.sharedPreferences.getBool('mode') == true
                  ? white
                  : primaryColor,
            ))
          : GoogleFonts.amiri(
              textStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: myServices.sharedPreferences.getBool('mode') == true
                  ? white
                  : primaryColor,
            ));
}

TextStyle get bodyStyle {
  return myServices.sharedPreferences.getString('lang') == 'en'
      ? GoogleFonts.barlowCondensed(
          textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: myServices.sharedPreferences.getBool('mode') == true
              ? white
              : primaryColor,
        ))
      : myServices.sharedPreferences.getString('lang') == 'ar'
          ? GoogleFonts.cairo(
              textStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: myServices.sharedPreferences.getBool('mode') == true
                  ? white
                  : primaryColor,
            ))
          : GoogleFonts.amiri(
              textStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: myServices.sharedPreferences.getBool('mode') == true
                  ? white
                  : primaryColor,
            ));
}

TextStyle get numberStyle {
  return myServices.sharedPreferences.getString('lang') == 'en'
      ? GoogleFonts.barlowCondensed(
          textStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: myServices.sharedPreferences.getBool('mode') == true
              ? white
              : primaryColor,
        ))
      : myServices.sharedPreferences.getString('lang') == 'ar'
          ? GoogleFonts.cairo(
              textStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: myServices.sharedPreferences.getBool('mode') == true
                  ? white
                  : primaryColor,
            ))
          : GoogleFonts.amiri(
              textStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: myServices.sharedPreferences.getBool('mode') == true
                  ? white
                  : primaryColor,
            ));
}

double constScreenPadding = 15.w;
double constRadius = 8.r;
String appName = 'DC Duhok Store';
