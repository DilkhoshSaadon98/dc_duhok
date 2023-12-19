import 'package:dc_duhok/core/class/crud.dart';
import 'package:dc_duhok/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.viewnotification, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  readNotification(String id) async {
    var response = await crud.postData(AppLink.readNotification, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response = await crud.postData(AppLink.deleteNotification, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
