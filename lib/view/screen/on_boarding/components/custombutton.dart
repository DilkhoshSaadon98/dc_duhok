import 'package:dc_duhok/controller/onboarding_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 50,
      width: Get.width,
      child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
          textColor: secondColor,
          onPressed: () {
            controller.next();
          },
          color: primaryColor,
          child: Text(
            "Next".tr,
            style: titleStyle.copyWith(color: secondColor),
          )),
    );
  }
}
