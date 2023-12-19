import 'package:dc_duhok/core/class/statusrequest.dart';
import 'package:dc_duhok/core/functions/handing_data_controller.dart';
import 'package:dc_duhok/core/functions/login_confirm_dialog.dart';
import 'package:dc_duhok/core/services/services.dart';
import 'package:dc_duhok/core/shared/custom_snack_bar.dart';
import 'package:dc_duhok/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  Map isFavorite = {};

//  key => id items
//  Value => 1 OR 0

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsid) async {
    if (myServices.sharedPreferences.getString('step') == '1') {
      confirmLogin();
    } else {
      statusRequest = StatusRequest.loading;
      var response = await favoriteData.addFavorite(
          myServices.sharedPreferences.getString("id")!, itemsid);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        // Start backend
        if (response['status'] == "success") {
          data.clear();
          customSnackBar('Success', 'The Items Added To Favorite');
          // data.addAll(response['data']);
        } else {
          statusRequest = StatusRequest.failure;
        }
        // End
      }
    }

    update();
  }

  removeFavorite(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.clear();
        customSnackBar('Success', 'The Items Removed From Favorite');
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
}
