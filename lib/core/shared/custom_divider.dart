import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:flutter/material.dart';

Widget customDivider() {
  return Divider(
    thickness: 1,
    color: myServices.sharedPreferences.getBool('mode') == true
        ? white
        : primaryColor,
  );
}
