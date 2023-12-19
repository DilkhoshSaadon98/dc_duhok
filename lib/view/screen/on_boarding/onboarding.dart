import 'package:dc_duhok/controller/onboarding_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/shared/custom_button_global.dart';
import 'package:dc_duhok/view/screen/on_boarding/components/customslider.dart';
import 'package:dc_duhok/view/screen/on_boarding/components/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnBoardingControllerImp controller = Get.put(OnBoardingControllerImp());
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomButtonGlobal(
            text1: 'Next'.tr,
            onPressed: () {
              controller.next();
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: constScreenPadding),
          child: const SafeArea(
            child: Column(children: [
              Expanded(
                flex: 5,
                child: CustomSliderOnBoarding(),
              ),
              Expanded(flex: 1, child: CustomDotControllerOnBoarding())
            ]),
          ),
        ));
  }
}
