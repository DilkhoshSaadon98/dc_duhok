import 'package:dc_duhok/controller/auth/login_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/constant/imgaeasset.dart';
import 'package:dc_duhok/core/functions/alert_exit_app.dart';
import 'package:dc_duhok/core/functions/validinput.dart';
import 'package:dc_duhok/core/shared/custom_button_global.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'components/custom_textform_auth.dart';
import 'components/text_signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: Stack(
            children: [
              GetBuilder<LoginControllerImp>(
                builder: (controller) => Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstateLogin,
                    child: ListView(children: [
                      customSizedBox(),
                      // Image.asset(width: 200, height: 200, AppImageAsset.login),
                      Lottie.asset(
                        width: 200,
                        height: 200,
                        AppImageAsset.login,
                      ),
                      customSizedBox(20),
                      Text(
                        'Welcome To'.tr,
                        textAlign: TextAlign.center,
                        style: titleStyle.copyWith(fontSize: 18),
                      ),
                      Text(
                        appName,
                        textAlign: TextAlign.center,
                        style: titleStyle.copyWith(
                            color: secondColor, fontSize: 22),
                      ),
                      Text(
                        'Sign In With Your Email And Password'.tr,
                        textAlign: TextAlign.center,
                        style: bodyStyle.copyWith(height: 1.5, fontSize: 14),
                      ),
                      customSizedBox(25),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!.trim(), 3, 100, "email");
                        },
                        mycontroller: controller.email,
                        hinttext: "example@gmail.com",
                        iconData: Icons.email_outlined,
                        labeltext: "E-mail".tr,
                        // mycontroller: ,
                      ),
                      customSizedBox(25),
                      CustomTextFormAuth(
                        obscureText: controller.isshowpassword,
                        onTapIcon: () {
                          controller.showPassword();
                        },
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!.trim(), 3, 30, "password");
                        },
                        mycontroller: controller.password,
                        hinttext: "".tr,
                        iconData: Icons.lock_outline,
                        labeltext: "Password".tr,
                        isPassword: controller.isshowpassword,
                        // mycontroller: ,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            controller.goToForgetPassword();
                          },
                          child: Text(
                            "Forget Password".tr,
                            textAlign: TextAlign.right,
                            style: titleStyle.copyWith(
                                decoration: TextDecoration.underline,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      customSizedBox(20),
                      CustomButtonGlobal(
                        text1: 'Log In'.tr,
                        onPressed: () {
                          controller.login();
                        },
                      ),
                      customSizedBox(),
                      CustomTextSignUpOrSignIn(
                        textone: "Dont Have An Account ? ".tr,
                        texttwo: "Sign Up".tr,
                        onTap: () {
                          controller.goToSignUp();
                        },
                      ),
                      customSizedBox()
                    ]),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 25, right: 10, left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:
                      myServices.systemSharedPreferences.getString('step') !=
                              '2'
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.end,
                  children: [
                    myServices.systemSharedPreferences.getString('step') != '2'
                        ? IconButton(
                            onPressed: () async {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: primaryColor,
                            ))
                        : Container(),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
