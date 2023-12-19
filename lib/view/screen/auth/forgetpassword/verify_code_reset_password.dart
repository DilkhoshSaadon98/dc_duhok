import 'package:dc_duhok/controller/auth/forgetpassword/verifycode_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../components/custom_texttitle_auth.dart';

class VerfiyCodeResetPassword extends StatelessWidget {
  const VerfiyCodeResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: customAppBarTitle('Verification Code'.tr, true),
      body: Container(
        height: Get.height,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomTextTitleAuth(text: "Check code".tr),
          customSizedBox(),
          Text(
            'Please enter verify code that sent to '.tr,
            textAlign: TextAlign.center,
            style: bodyStyle,
          ),
          Text(
            "${controller.email}",
            style:
                titleStyle.copyWith(fontSize: 20, color: AppColor.secondColor),
          ),
          const SizedBox(height: 30),
          OtpTextField(
            textStyle: numberStyle.copyWith(fontSize: 16),
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
              controller.goToResetPassword(verificationCode);
            }, // end onSubmit
          ),
        ]),
      ),
    );
  }
}
