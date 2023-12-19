import 'package:dc_duhok/core/class/statusrequest.dart';
import 'package:dc_duhok/core/constant/routes.dart';
import 'package:dc_duhok/core/functions/handing_data_controller.dart';
import 'package:dc_duhok/core/services/services.dart';
import 'package:dc_duhok/data/datasource/remote/orders/notification_data.dart';
import 'package:dc_duhok/data/model/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());
  List<NotificationModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
//! Get Data From backend :
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await notificationData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.clear();
        List listData = response['data'];
        data.addAll(listData.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  readNotification(String id) async {
    statusRequest = StatusRequest.loading;
    var response = await notificationData.readNotification(id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getData();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  // favoriteData.deleteData(favroiteid);
  // data.removeWhere((element) => element.favoriteId == favroiteid);
  // update();
  deleteNotification(int index) async {
    notificationData.deleteData(index.toString());
    getData();
    update();
  }

  goToDetails(String title, String content, String time) {
    Get.toNamed(AppRoute.notificationRead, arguments: {
      'title': title,
      'content': content,
      'time': time
    });
  }

  @override
  void onInit() async {
    await getData();
    super.onInit();
  }
}

class NotificationDetailsController extends GetxController {
  String? title;
  String? content;
  String? time;
  String? username;
  @override
  void onInit() {
    title = Get.arguments['title'];
    content = Get.arguments['content'];
    time = Get.arguments['time'];
    username = Get.arguments['username'];
    super.onInit();
  }
}
