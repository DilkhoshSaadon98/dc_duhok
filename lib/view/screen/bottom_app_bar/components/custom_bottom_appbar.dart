import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dc_duhok/controller/main_screen_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends GetView<MainScreenControllerImp> {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenControllerImp>(
        builder: (controller) => Container(
            decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(
                    width: .5,
                    color: myServices.sharedPreferences.getBool('mode') != true
                        ? white
                        : white))),
            child: CurvedNavigationBar(
              height: 55.h,
              animationCurve: Curves.linearToEaseOut,
              animationDuration: const Duration(milliseconds: 500),
              backgroundColor: white,
              color: myServices.sharedPreferences.getBool('mode') == true
                  ? black
                  : primaryColor,
              buttonBackgroundColor:
                  myServices.sharedPreferences.getBool('mode') == true
                      ? black
                      : primaryColor,
              index: controller.currentpage,
              items: [
                Icon(controller.bottomappbar[0]['outlined_icon'],
                    size: 25, color: secondColor),
                Icon(controller.bottomappbar[1]['outlined_icon'],
                    size: 25, color: secondColor),
                Container(),
                Icon(controller.bottomappbar[3]['outlined_icon'],
                    size: 25, color: secondColor),
                Icon(controller.bottomappbar[4]['outlined_icon'],
                    size: 25, color: secondColor),
              ],
              onTap: (value) {
                controller.changePage(value);
              },
            )));
  }
}
