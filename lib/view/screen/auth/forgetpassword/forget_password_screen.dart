import 'package:dc_duhok/controller/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:dc_duhok/core/class/handlingdataview.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/imgaeasset.dart';
import 'package:dc_duhok/core/functions/validinput.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../components/custom_button_auth.dart';
import '../components/custom_textform_auth.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: customAppBarTitle('Forget Password'.tr, true),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: constScreenPadding),
        child: CustomButtomAuth(
            text: "Check".tr,
            onPressed: () {
              controller.checkemail();
            }),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => Container(
                height: Get.height,
                padding: EdgeInsets.symmetric(horizontal: constScreenPadding),
                child: Form(
                  key: controller.formstate,
                  child: ListView(children: [
                    customSizedBox(25),
                    Lottie.asset(
                      width: 200,
                      height: 200,
                      AppImageAsset.checkMail,
                    ),
                    customSizedBox(25),
                    Text(
                      'Please enter your email address and we will send verification code to your account after check your account'
                          .tr,
                      textAlign: TextAlign.center,
                      style: bodyStyle,
                    ),
                    customSizedBox(),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 100, "email");
                      },
                      mycontroller: controller.email,
                      hinttext: "ex: example@gmail.com".tr,
                      iconData: Icons.email_outlined,
                      labeltext: "E-mail".tr,
                      // mycontroller: ,
                    ),
                  ]),
                ),
              )),
    );
  }
}
