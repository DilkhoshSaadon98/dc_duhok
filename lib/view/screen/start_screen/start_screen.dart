import 'package:dc_duhok/controller/start_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/constant/imgaeasset.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/view/screen/start_screen/components/language_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StartController());
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            color: primaryColor,
            padding: EdgeInsets.only(
                top: 150, left: constScreenPadding, right: constScreenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Lottie.asset(AppImageAsset.language)),
                customSizedBox(50),
                Text(
                  'Welcome, '.tr,
                  textAlign: TextAlign.start,
                  style: titleStyle.copyWith(fontSize: 30, color: secondColor),
                ),
                Text(
                  "Let's Get Started . . . ".tr,
                  style: bodyStyle.copyWith(fontSize: 20, color: secondColor),
                )
              ],
            ),
          ),
          GetBuilder<StartController>(builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: secondColor,
                  child: IconButton(
                      onPressed: () {
                        controller.changeHeight(
                            controller.continerHeight > 150.0 ? 150.0 : 300.0);
                      },
                      icon: Icon(
                        controller.continerHeight > 150.0
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up_sharp,
                        color: primaryColor,
                        size: 25,
                      )),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInCirc,
                  height: controller.continerHeight,
                  width: Get.width,
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: constScreenPadding),
                    children: [
                      customSizedBox(30),
                      Text(
                        textAlign: TextAlign.start,
                        'Select Your Language'.tr,
                        style: titleStyle.copyWith(
                            fontSize: 20, color: primaryColor),
                      ),
                      customSizedBox(25),
                      GetBuilder<StartController>(builder: (controller) {
                        return Column(
                          children: [
                            ...List.generate(
                                controller.title.length,
                                (index) => LanguageListTile(
                                      title: controller.title[index],
                                    ))
                          ],
                        );
                      })
                    ],
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
