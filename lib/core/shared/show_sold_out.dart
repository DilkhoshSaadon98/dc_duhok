import 'package:dc_duhok/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Widget soldOut(int itemsCount) {
  return itemsCount == 0
      ? Container(
          alignment: Alignment.center,
          width: Get.width * .44,
          //color: primaryColor.withOpacity(.8),
          child: Lottie.asset(AppImageAsset.slodOut, width: 100, height: 100)
          //    Text('Sold Out', style: titleStyle.copyWith(color: secondColor)),
          )
      : Container();
}
