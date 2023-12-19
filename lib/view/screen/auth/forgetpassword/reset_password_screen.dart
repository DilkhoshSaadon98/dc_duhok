import 'package:dc_duhok/controller/auth/forgetpassword/resetpassword_controller.dart';
import 'package:dc_duhok/core/class/handlingdataview.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/imgaeasset.dart';
import 'package:dc_duhok/core/functions/validinput.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

import '../../../../core/constant/color.dart';
import '../components/custom_button_auth.dart';
import '../components/custom_textform_auth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: customAppBarTitle('Reset Password'.tr, true),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: constScreenPadding),
        child: CustomButtomAuth(
            text: "Save Changes".tr,
            onPressed: () {
              controller.goToSuccessResetPassword();
            }),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) => Container(
                height: Get.height,
                padding: EdgeInsets.symmetric(
                    vertical: 15, horizontal: constScreenPadding),
                child: Form(
                  key: controller.formstate,
                  child: ListView(children: [
                    customSizedBox(25),
                    Lottie.asset(
                      width: 150,
                      height: 150,
                      AppImageAsset.resetPassword,
                    ),
                    customSizedBox(50),
                    Text(
                      'Please type a new password and then repeaet your password to confirm . . .'
                          .tr,
                      style: bodyStyle,
                      textAlign: TextAlign.center,
                    ),
                    customSizedBox(25),
                    PasswordStrengthChecker(
                      configuration: PasswordStrengthCheckerConfiguration(
                          animationCurve: Curves.bounceInOut,
                          animationDuration: const Duration(milliseconds: 1),
                          borderColor: primaryColor,
                          externalBorderRadius:
                              BorderRadiusDirectional.circular(5),
                          height: 15,
                          statusWidgetAlignment: MainAxisAlignment.center,
                          borderWidth: 1),
                      strength: controller.passNotifier,
                    ),
                    customSizedBox(),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 8, 40, "password");
                      },
                      onChanged: (value) {
                        controller.passNotifier.value =
                            PasswordStrength.calculate(text: value);
                        controller.password = value;
                      },
                      hinttext: "".tr,
                      iconData: Icons.lock_outline,
                      labeltext: "New Password".tr,
                      // mycontroller: ,
                    ),
                    customSizedBox(),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 8, 40, "password");
                      },
                      onChanged: (value) {
                        controller.repassword = value;
                      },
                      hinttext: "",
                      iconData: Icons.lock_outline,
                      labeltext: "Confirm Password".tr,
                      // mycontroller: ,
                    ),
                  ]),
                ),
              )),
    );
  }
}
