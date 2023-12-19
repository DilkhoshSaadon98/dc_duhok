import 'package:dc_duhok/core/class/statusrequest.dart';
import 'package:dc_duhok/core/functions/handing_data_controller.dart';
import 'package:dc_duhok/core/services/services.dart';
import 'package:dc_duhok/core/shared/custom_snack_bar.dart';
import 'package:dc_duhok/data/datasource/remote/orders/archive_data.dart';
import 'package:dc_duhok/data/datasource/remote/rating_data.dart';
import 'package:dc_duhok/data/model/orders_model.dart';
import 'package:get/get.dart';

class OrdersArchiveController extends GetxController {
  OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());
  RatingData ratingData = RatingData(Get.find());

  List<OrdersModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  String printOrderType(String val) {
    if (val == "0") {
      return "Delivery".tr;
    } else {
      return "Recive".tr;
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery".tr;
    } else {
      return "Payment Card".tr;
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Approve Pending".tr;
    } else if (val == "1") {
      return "The Order is being Prepared".tr;
    } else if (val == "2") {
      return "Ready To Picked up by Delivery Man".tr;
    } else if (val == "3") {
      return "On The Way".tr;
    } else {
      return "Archive".tr;
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  submitRating(String orderId, String rating, String comment) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ratingData.sendData(orderId, rating, comment);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        customSnackBar("Success", "Thanks For Your Response");
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  refrehOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
