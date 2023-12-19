import 'package:dc_duhok/controller/auth/sign_up_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/constant/imgaeasset.dart';
import 'package:dc_duhok/core/functions/alert_exit_app.dart';
import 'package:dc_duhok/core/functions/validinput.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/view/screen/auth/components/custom_texttitle_auth.dart';
import 'package:dc_duhok/view/screen/auth/components/logo_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_strength_checker/password_strength_checker.dart';
import 'components/custom_button_auth.dart';
import 'components/custom_textform_auth.dart';
import 'components/text_signup.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return Scaffold(
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpController>(
            builder: (controller) => Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: constScreenPadding),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      const LogoAuth(
                        title: AppImageAsset.registration,
                      ),
                      CustomTextTitleAuth(text: "Sign Up".tr),
                      customSizedBox(20),
                      CustomTextFormAuth(
                        capitalizeText: true,
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!.trim(), 3, 20, "");
                        },
                        hinttext: "ex: Dilkhosh".tr,
                        iconData: Icons.person_outline,
                        labeltext: "First Name".tr,
                        onChanged: (value) {
                          controller.firstName = value.trim();
                        },
                        // mycontroller: ,
                      ),
                      customSizedBox(20),
                      CustomTextFormAuth(
                        capitalizeText: true,
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!.trim(), 3, 20, "");
                        },
                        hinttext: "ex: Saadon".tr,
                        iconData: Icons.person_outline,
                        labeltext: "Last Name".tr,
                        onChanged: (value) {
                          controller.lastName = value.trim();
                        },
                        // mycontroller: ,
                      ),
                      customSizedBox(),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!.trim(), 3, 40, "email");
                        },
                        hinttext: "example@gmail.com".tr,
                        iconData: Icons.email_outlined,
                        labeltext: "E-mail".tr,
                        onChanged: (value) {
                          controller.email = value.trim();
                        },
                        // mycontroller: ,
                      ),
                      customSizedBox(),
                      CustomTextFormAuth(
                        isNumber: true,
                        valid: (val) {
                          return validInput(val!.trim(), 8, 15, "phone");
                        },
                        hinttext: "ex: 07510407010".tr,
                        iconData: Icons.phone_android_outlined,
                        labeltext: "Phone Number".tr,
                        onChanged: (value) {
                          controller.phone = value.trim();
                        },
                        // mycontroller: ,
                      ),
                      customSizedBox(),
                      CustomTextFormAuth(
                        obscureText: controller.isshowpassword,
                        isPassword: controller.isshowpassword,
                        onTapIcon: () {
                          controller.showPassword();
                        },
                        onChanged: (value) {
                          controller.passNotifier.value =
                              PasswordStrength.calculate(text: value.trim());
                          controller.password = value.trim();
                        },
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!.trim(), 8, 30, "password");
                        },
                        hinttext: "".tr,
                        iconData: Icons.lock_outline,
                        labeltext: "Password".tr,
                        // mycontroller: ,
                      ),
                      customSizedBox(10),
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
                      customSizedBox(25),
                      CustomButtomAuth(
                          text: "Sign Up".tr,
                          onPressed: () async {
                            await controller.signUp();
                          }),
                      customSizedBox(),
                      CustomTextSignUpOrSignIn(
                        textone: "Already Have an Account? ".tr,
                        texttwo: "Sign In".tr,
                        onTap: () {
                          controller.goToSignIn();
                        },
                      ),
                    ]),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: primaryColor,
                    child: IconButton(
                      onPressed: () {
                        controller.goToSignIn();
                      },
                      icon: Icon(
                        myServices.systemSharedPreferences.getString('lang') ==
                                'en'
                            ? Icons.arrow_forward_ios_outlined
                            : Icons.arrow_back_ios_outlined,
                        color: secondColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
