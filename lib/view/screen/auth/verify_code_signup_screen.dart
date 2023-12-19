import 'package:dc_duhok/controller/auth/verfiy_code_signup_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/view/screen/auth/components/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'components/custom_texttitle_auth.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeSignUpControllerImp controller =
        Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      // appBar: customAppBarTitle('Verification Code'.tr, true),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: constScreenPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButtomAuth(
              text: "Resend code".tr,
              onPressed: () {
                controller.reSend();
              },
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                  width: Get.width,
                  height: 45,
                  padding: const EdgeInsets.only(bottom: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: primaryColor)),
                  child: Text(
                    "Back to login".tr,
                    style: titleStyle.copyWith(fontSize: 16),
                  )),
            )
          ],
        ),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
          builder: (controller) => Container(
                width: Get.width,
                height: Get.height,
                padding: EdgeInsets.symmetric(
                    vertical: 15, horizontal: constScreenPadding),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customSizedBox(100),
                      CustomTextTitleAuth(text: "Check code".tr),
                      customSizedBox(10),
                      Text(
                        'Please enter verify code that sent to '.tr,
                        textAlign: TextAlign.center,
                        style: bodyStyle,
                      ),
                      Text(
                        controller.email.toString(),
                        textAlign: TextAlign.center,
                        style: titleStyle.copyWith(
                            fontSize: 18, color: AppColor.secondColor),
                      ),
                      customSizedBox(),
                      OtpTextField(
                        textStyle: numberStyle,
                        autoFocus: true,
                        cursorColor: secondColor,
                        focusedBorderColor: Colors.greenAccent,

                        fieldWidth: 50.0,
                        borderRadius: BorderRadius.circular(constRadius),
                        numberOfFields: 5,
                        borderColor: primaryColor,
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        borderWidth: 2,
                        keyboardType: TextInputType.number,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          controller.goToSuccessSignUp(verificationCode);
                        }, // end onSubmit
                      ),
                      customSizedBox(100),
                    ]),
              )),
    );
  }
}
