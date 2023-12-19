import 'package:dc_duhok/core/class/statusrequest.dart';
import 'package:dc_duhok/core/constant/routes.dart';
import 'package:dc_duhok/core/functions/handing_data_controller.dart';
import 'package:dc_duhok/core/functions/login_confirm_dialog.dart';
import 'package:dc_duhok/core/services/services.dart';
import 'package:dc_duhok/core/shared/custom_snack_bar.dart';
import 'package:dc_duhok/data/datasource/remote/cart_data.dart';
import 'package:dc_duhok/data/model/cart_model.dart';
import 'package:dc_duhok/data/model/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  TextEditingController? controllerCoupon;
  CartData cartData = CartData(Get.find());
  int? discountcoupon = 0;
  String? couponname;
  String? couponid;
  late StatusRequest statusRequest;
  CouponModel? couponModel;
  MyServices myServices = Get.find();
  List<CartModel> data = [];
  int priceorders = 0;
  int totalcountitems = 0;
  int shipingPrice = 5000;

  add(String itemsid, [int? count]) async {
    if (myServices.sharedPreferences.getString('step') == '1') {
      confirmLogin();
    } else {
      if (count == 0) {
        customSnackBar('Sorry', 'This items out of stock');
      } else {
        var response = await cartData.addCart(
            myServices.sharedPreferences.getString("id")!, itemsid);
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          // Start backend
          if (response['status'] == "success") {
            // customSnackBar('Success', 'The items added to cart'.tr);
            CartController cartController = Get.find();
            cartController.view();
            // data.addAll(response['data']);
          } else {
            statusRequest = StatusRequest.failure;
          }
          // End
        }
      }
    }

    update();
  }

  goToPageCheckout() {
    if (data.isEmpty) return customSnackBar("Warning", "Empty cart");
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid": couponid ?? "0",
      "priceorder": getTotalPrice(),
      "discountcoupon": discountcoupon.toString()
    });
  }

  int getTotalPrice() {
    return ((priceorders - priceorders * discountcoupon! / 100)).toInt();
  }

  delete(String itemsid) async {
    update();
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        // customSnackBar('Success', 'The items removed from cart');
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  checkcoupon() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.checkCoupon(controllerCoupon!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = int.parse(couponModel!.couponDiscount!.toString());
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId.toString();
      } else {
        // statusRequest = StatusRequest.failure;
        discountcoupon = 0;
        couponname = null;
        couponid = null;
        customSnackBar("Error", "Coupon Not Valid");
      }
      // End
    }
    update();
  }

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          data.clear();
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems =
              int.parse(dataresponsecountprice['totalcount'].toString());
          priceorders = dataresponsecountprice['totalprice'];
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  int getTotalCount() {
    view();
    int count = totalcountitems;
    update();
    return count;
  }

  @override
  void onInit() {
    controllerCoupon = TextEditingController();
    view();
    getTotalCount();
    super.onInit();
  }
}
