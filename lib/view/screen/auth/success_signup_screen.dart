import 'package:dc_duhok/controller/auth/successsignup_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/imgaeasset.dart';
import 'package:dc_duhok/core/shared/custom_button_global.dart';
import 'package:dc_duhok/view/screen/auth/components/logo_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: constScreenPadding),
        child: CustomButtonGlobal(
            text1: 'Log In'.tr,
            onPressed: () {
              controller.goToPageLogin();
            }),
      ),
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoAuth(
                title: AppImageAsset.successCreateAccount,
              ),
            ],
          )),
    );
  }
}
