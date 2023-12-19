import 'package:dc_duhok/core/class/statusrequest.dart';
import 'package:dc_duhok/core/functions/handing_data_controller.dart';
import 'package:dc_duhok/core/services/services.dart';
import 'package:dc_duhok/core/shared/custom_snack_bar.dart';
import 'package:dc_duhok/data/datasource/remote/orders/pending_data.dart';
import 'package:dc_duhok/data/model/orders_model.dart';
import 'package:get/get.dart';

class OrdersPendingController extends GetxController {
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());

  List<OrdersModel> data = [];

  late StatusRequest statusRequest = StatusRequest.none;

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
      return "Pending Approval".tr;
    } else if (val == "1") {
      return "The Order is being Prepared".tr;
    } else if (val == "2") {
      return "Ready To Pick Up By Delivery Man".tr;
    } else if (val == "3") {
      return "On The Way".tr;
    } else {
      return "Archive".tr;
    }
  }

  getOrders() async {
    update();
    var response = await ordersPendingData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.clear();
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteOrder(String orderid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.deleteData(orderid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        customSnackBar('Success', 'The Orders Removed From Archive . . .');
        data.removeWhere((element) => element.ordersId == int.parse(orderid));
        getOrders();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
