import 'package:dc_duhok/controller/main_screen_controller.dart';
import 'package:dc_duhok/core/constant/color.dart'; 
import 'package:dc_duhok/core/constant/routes.dart';
import 'package:dc_duhok/core/functions/alert_exit_app.dart';
import 'package:dc_duhok/view/screen/bottom_app_bar/components/custom_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainScreenControllerImp());
    return GetBuilder<MainScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton.extended(
                  shape: CircleBorder(
                      side: BorderSide(color: primaryColor, width: .5)),
                  backgroundColor: secondColor,
                  elevation: 5,
                  highlightElevation: 5,
                  onPressed: () {
                    Get.toNamed(AppRoute.cart);
                  },
                  label: Icon(
                    Icons.shopping_basket_outlined,
                    color: primaryColor,
                  )),
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: WillPopScope(
                  onWillPop: alertExitApp,
                  child: controller.listPage.elementAt(controller.currentpage)),
            ));
  }
}
