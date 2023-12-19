import 'dart:async';
import 'package:dc_duhok/core/class/statusrequest.dart';
import 'package:dc_duhok/core/constant/imgaeasset.dart';
import 'package:dc_duhok/core/constant/routes.dart';
import 'package:dc_duhok/core/functions/handing_data_controller.dart';
import 'package:dc_duhok/core/services/services.dart';
import 'package:dc_duhok/data/datasource/remote/home_data.dart';
import 'package:dc_duhok/data/model/items_model.dart';
import 'package:dc_duhok/view/screen/home/components/custom_card_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchMixController extends GetxController {
  final FocusNode textFieldFocusNode = FocusNode();

  @override
  void dispose() {
    textFieldFocusNode.dispose();
    super.dispose();
  }

  void unfocusTextField() {
    // Call the unfocus method to remove focus from the TextField
    textFieldFocusNode.unfocus();
    update();
  }

  List<ItemsModel> listdataSearch = [];

  late StatusRequest statusRequest;
  HomeData homeData = HomeData(Get.find());

  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
      unfocusTextField();
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  searchData([String? catID]) async {
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
}

abstract class HomeController extends SearchMixController {
  initialData();
  getdata();
  goToItems(List categories, int selectedCat, String categoryid);
}

class HomeControllerImp extends HomeController {
  ScrollController scrollController = ScrollController();
  //! Page View Builder :
  int currentPageIndex = 0;
  final PageController pageController = PageController();
  late Timer autoChangeTimer;
  void startAutoChange() {
    autoChangeTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (currentPageIndex < ourOffers.length - 1) {
        currentPageIndex++;
        update();
      } else {
        currentPageIndex = 0;
        update();
      }
      pageController.animateToPage(
        currentPageIndex,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
    });
  }

  MyServices myServices = Get.find();
  bool isDark = true;
  List<Color> listColorDark = [
    Colors.red.withOpacity(0.9),
    Colors.blue.withOpacity(0.9),
    Colors.yellow.withOpacity(0.9),
    Colors.orange.withOpacity(0.9),
    Colors.green.withOpacity(0.9),
    Colors.teal.withOpacity(0.9)
  ];
  List<Color> listColorLight = [
    Colors.red.withOpacity(0.4),
    Colors.blue.withOpacity(0.4),
    Colors.yellow.withOpacity(0.4),
    Colors.orange.withOpacity(0.4),
    Colors.green.withOpacity(0.4),
    Colors.teal.withOpacity(0.4),
  ];
  String? username;
  String? id;
  String? lang;
  HomeData homeDataRemote = HomeData(Get.find());

  // List data = [];
  List categories = [];
  List items = [];
  List ourOffers = [];
  List newArrivalItems = [];
  // List items = [];

  @override
  initialData() {
    // myServices.sharedPreferences.clear() ;
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    scrollController = ScrollController();
    getdata();
    initialData();
    startAutoChange();
    super.onInit();
  }

  @override
  getdata() async {
    items.clear();
    categories.clear();
    newArrivalItems.clear();
    ourOffers.clear();
    statusRequest = StatusRequest.loading;
    var response = await homeDataRemote.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['catagories']['data']);
        ourOffers.addAll(response['our_offers']['data']);
        if (response['items2']['status'] == 'failure') {
          items.addAll(response['items']['data']);
        } else {
          items.addAll(response['items2']['data']);
        }
        if (response['newArrival']['status'] == 'success') {
          newArrivalItems.addAll(response['newArrival']['data']);
        } else {
          newArrivalItems = [];
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
  }

  showItems(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
  }
}
