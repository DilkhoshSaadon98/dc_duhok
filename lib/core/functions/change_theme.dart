import 'package:dc_duhok/core/constant/color.dart';
import 'package:flutter/material.dart';

changeThemeColor(bool check) {
  if (check == true) {
    primaryColor = white;
  } else {
    primaryColor = const Color(0xff133E58);
  }
}
