import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/constant/imgaeasset.dart';
import 'package:dc_duhok/core/constant/routes.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

checkUserAccount(Widget widget) {
  return myServices.sharedPreferences.getString('step') == '1'
      ? SizedBox(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(AppImageAsset.createAccount, width: 200),
              customSizedBox(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "It only takes a minute to create an account and join our community. Your journey to a richer app experience starts here!"
                      .tr,
                  textAlign: TextAlign.center,
                  style: bodyStyle.copyWith(),
                ),
              ),
              customSizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              ContinuousRectangleBorder(
                                  side: BorderSide(color: primaryColor),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(constRadius)))),
                          minimumSize:
                              const MaterialStatePropertyAll(Size(125, 40)),
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor)),
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
                          minimumSize:
                              const MaterialStatePropertyAll(Size(125, 40)),
                          backgroundColor: MaterialStateProperty.all(white),
                          shape: MaterialStatePropertyAll(
                              ContinuousRectangleBorder(
                                  side: BorderSide(color: primaryColor),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(constRadius))))),
                      onPressed: () {
                        Get.back();
                        Get.toNamed(AppRoute.signUp);
                      },
                      child: Text(
                        "Sign Up".tr,
                        style: titleStyle.copyWith(color: primaryColor),
                      )),
                ],
              ),
            ],
          ),
        )
      : widget;
}
