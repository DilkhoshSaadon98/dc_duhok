import 'package:dc_duhok/controller/onboarding_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                customSizedBox(),
                Image.asset(
                  onBoardingList[i].image!,
                  height: Get.width / 1.3,
                  fit: BoxFit.fill,
                ),
                customSizedBox(30),
                Text(onBoardingList[i].title!,
                    textAlign: TextAlign.center,
                    style:
                        titleStyle.copyWith(fontSize: 18, color: secondColor)),
                customSizedBox(),
                Flexible(
                  child: Text(
                    onBoardingList[i].body!.tr,
                    textAlign: TextAlign.justify,
                    style: bodyStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                )
              ],
            ));
  }
}
