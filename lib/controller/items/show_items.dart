import 'package:dc_duhok/controller/home_controller.dart';
import 'package:dc_duhok/core/constant/routes.dart';
import 'package:dc_duhok/core/services/services.dart';
import 'package:dc_duhok/data/datasource/remote/items_data.dart';
import 'package:dc_duhok/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ShowItemsController extends GetxController {
  intialData();
  goToPageProductDetails(ItemsModel itemsModel);
}

class ShowItemsControllerImp extends SearchMixController {
  ItemsData itemData = ItemsData(Get.find());

  List data = [];

  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    data = Get.arguments['data'];
    print(data);
    super.onInit();
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {
      "itemsmodel": itemsModel,
    });
  }
}
