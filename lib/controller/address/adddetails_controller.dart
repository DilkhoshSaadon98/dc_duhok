import 'package:dc_duhok/core/class/statusrequest.dart';
import 'package:dc_duhok/core/constant/routes.dart';
import 'package:dc_duhok/core/functions/handing_data_controller.dart';
import 'package:dc_duhok/core/services/services.dart';
import 'package:dc_duhok/data/datasource/remote/address_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddAddressDetailsController extends GetxController {
  StatusRequest? statusRequest;

  AddressData addressData = AddressData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  MyServices myServices = Get.find();

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? moreInfo;

  String? lat;
  String? long;

  String selectedCity = 'Duhok Center';
  void changeCity(String city) {
    selectedCity = city;
    update();
  }

  intialData() {
    name = TextEditingController();
    street = TextEditingController();
    moreInfo = TextEditingController();
  }

  addAddress() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addressData.addData(
          myServices.sharedPreferences.getString("id")!,
          name!.text,
          selectedCity,
          street!.text,
          moreInfo!.text);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        // Start backend
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoute.homepage);
        } else {
          statusRequest = StatusRequest.failure;
        }
        // End
      }
      update();
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  void onClose() {
    street!.dispose();
    moreInfo!.dispose();
    name!.dispose();
    super.onClose();
  }
}
