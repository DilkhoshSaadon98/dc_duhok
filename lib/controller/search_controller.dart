import 'package:dc_duhok/core/class/statusrequest.dart';
import 'package:dc_duhok/core/functions/handing_data_controller.dart';
import 'package:dc_duhok/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/datasource/remote/home_data.dart';

class SearchMixController extends GetxController {
  List<ItemsModel> listdataSearch = [];

  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());

  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdataSearch.clear();
        List responsedata = response['data'];
        listdataSearch.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    search!.dispose();
    super.dispose();
  }
}
