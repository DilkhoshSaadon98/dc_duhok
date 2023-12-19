import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> confirmLogin() {
  Get.defaultDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      radius: constRadius,
      backgroundColor:
          myServices.sharedPreferences.getBool('mode') == true ? black : white,
      //  title: 'Welcome to DC DUHOK',
      title: 'Welcome, '.tr,
      titleStyle:titleStyle.copyWith(fontSize: 22),
      middleText:
          "It only takes a minute to create an account and join our community. Your journey to a richer app experience starts here!"
              .tr,
      middleTextStyle: bodyStyle.copyWith(fontSize: 18),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                minimumSize: const MaterialStatePropertyAll(Size(200, 40)),
                backgroundColor: MaterialStateProperty.all(primaryColor)),
            onPressed: () {
              Get.back();
              Get.toNamed(AppRoute.login);
            },
            child: Text(
              "Log In".tr,
              style: titleStyle.copyWith(color: secondColor),
            )),
        ElevatedButton(
            style: ButtonStyle(
                minimumSize: const MaterialStatePropertyAll(Size(200, 40)),
                backgroundColor: MaterialStateProperty.all(white),
                shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                    side: BorderSide(color: primaryColor),
                    borderRadius:
                        BorderRadius.all(Radius.circular(constRadius))))),
            onPressed: () {
              Get.back();
              Get.toNamed(AppRoute.signUp);
            },
            child: Text(
              "Sign Up".tr,
              style: titleStyle.copyWith(color: primaryColor),
            )),
      ]);
  return Future.value(true);
}
