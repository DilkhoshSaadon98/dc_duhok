import 'package:dc_duhok/core/class/statusrequest.dart';
import 'package:dc_duhok/core/constant/routes.dart';
import 'package:dc_duhok/core/functions/handing_data_controller.dart';
import 'package:dc_duhok/data/datasource/remote/auth/forgetpassword/checkemail.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  CheckEmailData checkEmailData = CheckEmailData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController email;
  @override
  checkemail() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postdata(email.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.verfiyCode, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "ُWarning".tr, middleText: "email address not found".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  // resetPassword() async {
  //   try {
  //     await _auth.sendPasswordResetEmail(email: email.text);
  //     customSnackBar(
  //         'Success',
  //         'Reset Link Sended To Your Email, Open Your Email Folder And Then Click  On Link In Message.',
  //         true);
  //     Get.offAllNamed(AppRoute.login);
  //     update();
  //   } on FirebaseAuthException catch (e) {
  //     customSnackBar("Error", e.message.toString());
  //   }
  // }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
