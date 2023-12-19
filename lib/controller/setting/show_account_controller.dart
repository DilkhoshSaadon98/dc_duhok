import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dc_duhok/core/class/statusrequest.dart';
import 'package:dc_duhok/core/constant/routes.dart';
import 'package:dc_duhok/core/functions/handing_data_controller.dart';
import 'package:dc_duhok/core/services/services.dart';
import 'package:dc_duhok/data/datasource/remote/auth/login.dart';
import 'package:dc_duhok/data/datasource/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ShowAccountController extends GetxController {
  //! Old:
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController firstName;
  late TextEditingController lastName;

  StatusRequest statusRequest = StatusRequest.none;
  bool isshowpassword = true;
  SignupData signupData = SignupData(Get.find());
  LoginData loginData = LoginData(Get.find());
  List data = [];
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await loginData
        .getUser(myServices.sharedPreferences.getString('email')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        firstName.text = response['data']['users_firstname'];
        lastName.text = response['data']['users_lastname'];
        phone.text = response['data']['users_phone'];
        email.text = response['data']['users_email'];
        password.text = '********';
      }
    }
    update();
  }

  editUser() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await signupData.updateData(
        myServices.sharedPreferences.getString('email')!,
        firstName.text,
        lastName.text,
        phone.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAndToNamed(AppRoute.homepage);
      } else {
        Get.back();
        // statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  MyServices myServices = Get.find();


  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    firstName = TextEditingController();
    lastName = TextEditingController();
    getData();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    phone.dispose();
    password.dispose();
    firstName.dispose();
    lastName.dispose();
    super.dispose();
  }
}
