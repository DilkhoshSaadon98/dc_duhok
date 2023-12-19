import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customSingleRowAddress(String title, String data) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title.tr,
        style: titleStyle,
      ),
      Text(
        data.tr,
        style: bodyStyle,
      ),
    ],
  );
}
