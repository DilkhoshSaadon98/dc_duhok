import 'package:dc_duhok/controller/setting/show_account_controller.dart';
import 'package:dc_duhok/core/class/handlingdataview.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/imgaeasset.dart';
import 'package:dc_duhok/core/functions/check_user_account.dart';
import 'package:dc_duhok/core/functions/validinput.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/core/shared/custom_widget_gsture_back.dart';
import 'package:dc_duhok/view/screen/auth/components/custom_button_auth.dart';
import 'package:dc_duhok/view/screen/auth/components/custom_textform_auth.dart';
import 'package:dc_duhok/view/screen/auth/components/logo_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ShowAccountController());
    return Scaffold(
        appBar: customAppBarTitle('Account'.tr, true),
        body: checkUserAccount(CustomWidgetBack(
            widget: GetBuilder<ShowAccountController>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: constScreenPadding),
                child: Form(
                  key: controller.formstate,
                  child: ListView(children: [
                    Text(
                      "Email and Password Can't changed if you have problem you can contact author",
                      style: bodyStyle.copyWith(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    const LogoAuth(
                      title: AppImageAsset.registration,
                    ),
                    customSizedBox(20),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 3, 20, "");
                      },
                      mycontroller: controller.firstName,
                      hinttext: "First Name".tr,
                      iconData: Icons.person_outline,
                      labeltext: "First Name".tr,
                      // mycontroller: ,
                    ),
                    customSizedBox(20),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 3, 20, "");
                      },
                      mycontroller: controller.lastName,
                      hinttext: "Last Name".tr,
                      iconData: Icons.person_outline,
                      labeltext: "Last Name".tr,
                      // mycontroller: ,
                    ),
                    customSizedBox(),
                    CustomTextFormAuth(
                      readOnly: true,
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 3, 40, "email");
                      },
                      mycontroller: controller.email,
                      hinttext: "example@gmail.com".tr,
                      iconData: Icons.email_outlined,
                      labeltext: "E-mail".tr,
                      // mycontroller: ,
                    ),
                    customSizedBox(),
                    CustomTextFormAuth(
                      isNumber: true,
                      valid: (val) {
                        return validInput(val!, 7, 15, "phone");
                      },
                      mycontroller: controller.phone,
                      hinttext: "Phone Number".tr,
                      iconData: Icons.phone_android_outlined,
                      labeltext: "Phone Number".tr,
                      // mycontroller: ,
                    ),
                    customSizedBox(),
                    CustomTextFormAuth(
                      readOnly: true,
                      obscureText: controller.isshowpassword,
                      isPassword: controller.isshowpassword,
                      onTapIcon: () {
                        controller.showPassword();
                      },
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 3, 30, "password");
                      },
                      mycontroller: controller.password,
                      hinttext: "*********".tr,
                      iconData: Icons.lock_outline,
                      labeltext: "Password".tr,
                      // mycontroller: ,
                    ),
                    customSizedBox(25),
                    CustomButtomAuth(
                        text: "Save Changes".tr,
                        onPressed: () async {
                          await controller.editUser();
                        }),
                  ]),
                ),
              )),
        ))));
  }
}
