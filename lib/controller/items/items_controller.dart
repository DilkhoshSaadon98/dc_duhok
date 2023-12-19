import 'package:dc_duhok/controller/home_controller.dart';
import 'package:dc_duhok/core/class/statusrequest.dart';
import 'package:dc_duhok/core/constant/routes.dart';
import 'package:dc_duhok/core/functions/handing_data_controller.dart';
import 'package:dc_duhok/core/services/services.dart';
import 'package:dc_duhok/data/datasource/remote/items_data.dart';
import 'package:dc_duhok/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val, int catval);
  getItems(String categoryid);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchMixController {
  @override
  void dispose() {
    // Dispose of the FocusNode when it's no longer needed to avoid memory leaks
    textFieldFocusNode.dispose();
    super.dispose();
  }

  List categories = [];
  String? catid;
  int? selectedCat;

  ItemsData itemData = ItemsData(Get.find());

  List data = [];

  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    super.onInit();
  }

  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getItems(catid!);
  }

  changeCat(val, catval) {
    selectedCat = val;
    catid = catval.toString();
    getItems(catid!);
    update();
  }

  getItems(categoryid) async {
    data.clear();
    update();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemData.getData(
        categoryid, myServices.sharedPreferences.getString("id") ?? '0');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {
      "itemsmodel": itemsModel,
    });

    update();
  }
}
