import 'package:dc_duhok/core/class/statusrequest.dart';
import 'package:dc_duhok/core/constant/routes.dart';
import 'package:dc_duhok/core/functions/handing_data_controller.dart';
import 'package:dc_duhok/core/services/services.dart';
import 'package:dc_duhok/core/shared/custom_snack_bar.dart';
import 'package:dc_duhok/data/datasource/remote/address_data.dart';
import 'package:dc_duhok/data/datasource/remote/checkout_date.dart';
import 'package:dc_duhok/data/model/address_model.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  Map<String, int> cities = {
    'Duhok Center': 4000,
    'Duhok UOD': 4000,
    'Around Duhok': 5000,
    'Hawler': 5250,
    'Sulimanya': 5500,
    'Baghdad': 6000,
    'Mousel': 6000,
  };

  String? paymentMethod;
  String? deliveryType;
  String addressid = "0";
  int shipingPrice = 0;
  int totalPrice = 0;
  late String couponid;
  late String coupondiscount;
  int? priceorders;
  String? notifiLang = 'en';
  List<AddressModel> dataaddress = [];
  //! Choose Payment Method :
  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  //! Choose Delivery Type :
  chooseDeliveryType([String? val]) {
    deliveryType = val ?? "0";
    deliveryType == '0' ? shipingPrice : 0;
    totalPrice = priceorders! + shipingPrice;
    if (deliveryType == '1' && totalPrice > priceorders!) {
      totalPrice -= shipingPrice;
    }
    update();
  }

//! Choose Shipping Address :
  chooseShippingAddress(String val) {
    chooseDeliveryType();
    addressid = val;
    update();
  }

  getTotalPrice(int shippingprice) {
    totalPrice = priceorders! + shippingprice;
    update();
  }

  //! Get Shipping Address :
  getShippingAddress([int? index]) async {
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        dataaddress.clear();
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        shipingPrice = cities[dataaddress[index ?? 0].addressCity]!;
        getTotalPrice(shipingPrice);
        print(shipingPrice);
      } else {
        statusRequest = StatusRequest.success;
      }
      // End
    }
    update();
  }

  checkLanguage() {
    myServices.systemSharedPreferences.getString('lang') == 'en'
        ? notifiLang = 'en'
        : myServices.systemSharedPreferences.getString('lang') == 'ar'
            ? notifiLang = 'ar'
            : notifiLang = 'iw';
    update();
  }

  //! CheckOut :
  checkout() async {
    if (paymentMethod == null) {
      return customSnackBar("Error", "Please select a payment method . . .");
    }
    if (deliveryType == null) {
      return customSnackBar("Error", "Please select an orders type . . .");
    }
    if (addressid == '0' && deliveryType == '0') {
      return customSnackBar('Error', "Address can't be empty");
    }
    statusRequest = StatusRequest.loading;

    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": shipingPrice.toString(),
      "ordersprice": priceorders!.toString(),
      "couponid": couponid,
      "coupondiscount": coupondiscount.toString(),
      "paymentmethod": paymentMethod.toString(),
      'notifi_lang': notifiLang
    };
    var response = await checkoutData.checkout(data);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
        customSnackBar("Success", "The order successfully sent");
      } else {
        statusRequest = StatusRequest.none;
        customSnackBar("Error", "Try again please . . .");
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorder'];
    coupondiscount = Get.arguments['discountcoupon'].toString();
    getShippingAddress();
    super.onInit();
  }
}
