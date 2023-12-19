import 'package:dc_duhok/core/services/services.dart';
import 'package:get/get.dart';

translateDatabase(columnar, columnen, columnku) {
  MyServices myServices = Get.find();

  if (myServices.systemSharedPreferences.getString("lang") == "ar") {
    return columnar;
  } else if (myServices.systemSharedPreferences.getString("lang") == "he") {
    return columnku;
  } else {
    return columnen;
  }
}
