import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dc_duhok/core/class/statusrequest.dart';
import 'package:dc_duhok/core/constant/routes.dart';
import 'package:dc_duhok/core/functions/handing_data_controller.dart';
import 'package:dc_duhok/core/services/services.dart';
import 'package:dc_duhok/core/shared/custom_snack_bar.dart';
import 'package:dc_duhok/data/datasource/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

class SignUpController extends GetxController {
  //! Old:
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final passNotifier = ValueNotifier<PasswordStrength?>(null);
  late String email;
  late String phone;
  late String password;
  late String firstName;
  late String lastName;

  StatusRequest statusRequest = StatusRequest.none;
  bool isshowpassword = true;
  SignupData signupData = SignupData(Get.find());
  List data = [];
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postdata(
          firstName.trim(),
          lastName.trim(),
          password.trim(),
          email.trim(),
          phone.trim());
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          customSnackBar(
              'Success',
              'Account created sccesfully open your email folder then use verify code to verify your account',
              true);
          Get.offNamed(AppRoute.verfiyCodeSignUp,
              arguments: {"email": email});
        } else {
          Get.defaultDialog(
              title: "ُWarning",
              middleText:
                  "email address already exist, please try with another email or reset your password ...");
          // statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  //! New :
  MyServices myServices = Get.find();
  final _auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance.collection('users');
  Future<void> createAccount() async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      if (formstate.currentState!.validate()) {
        await _auth
            .createUserWithEmailAndPassword(
                email: email, password: password)
            .then((value) async {
          firestore.doc(email).set({
            "Email": email.trim(),
            "Password": password.trim(),
            "First Name": firstName.trim(),
            "Last Name": lastName.trim(),
            "Mobile Number": phone.trim(),
          }).then((value) async {
            User? user = FirebaseAuth.instance.currentUser;
            await user?.sendEmailVerification();
            await signUp();
          });
        });
      }

      //   myServices.sharedPreferences.setString('fisrtName', firstName);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message.toString(),
          duration: const Duration(seconds: 2));
    }
  }

  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

}
