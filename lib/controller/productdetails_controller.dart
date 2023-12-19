import 'package:dc_duhok/controller/cart_controller.dart';
import 'package:dc_duhok/core/class/statusrequest.dart';
import 'package:dc_duhok/core/functions/handing_data_controller.dart';
import 'package:dc_duhok/core/functions/login_confirm_dialog.dart';
import 'package:dc_duhok/core/services/services.dart';
import 'package:dc_duhok/core/shared/custom_snack_bar.dart';
import 'package:dc_duhok/data/datasource/remote/cart_data.dart';
import 'package:dc_duhok/data/datasource/remote/items_data.dart';
import 'package:dc_duhok/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  // CartController cartController = Get.put(CartController());

  late ItemsModel itemsModel;
  CartData cartData = CartData(Get.find());
  ItemsData itemData = ItemsData(Get.find());
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  List dataImage = [];
  int countitems = 0;
  String imageRoot = '';

  changeImge(String url) {
    imageRoot = url;
    update();
  }

  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems = await getCountItems(itemsModel.itemsId!.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  getImages(id) async {
    statusRequest = StatusRequest.loading;
    var response = await itemData.getItemsImage(id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        dataImage.clear();
        dataImage.addAll(response['data']);
        imageRoot = dataImage[0]['items_images_name'];
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = int.parse(response['data'].toString());

        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }

  addItems(String itemsid) async {
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        customSnackBar('Success', 'The items added to cart');
        CartController cartController = Get.find();
        cartController.view();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteitems(String itemsid) async {
    update();
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        customSnackBar('Success', 'The items removed from cart');
        CartController cartController = Get.find();
        cartController.view();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  add() {
    if (myServices.sharedPreferences.getString('step') == '1') {
      confirmLogin();
    }
    else if (countitems < itemsModel.itemsCount!) {
      addItems(itemsModel.itemsId!.toString());
      countitems++;
      update();
    } else {
      customSnackBar('Warning', 'Items count not enough');
    }
  }

  remove() {
    if (countitems > 0) {
      deleteitems(itemsModel.itemsId!.toString());
      countitems--;
      update();
    }
  }

  @override
  void onInit() {
    intialData();
    getImages(itemsModel.itemsId.toString());
    super.onInit();
  }
}
