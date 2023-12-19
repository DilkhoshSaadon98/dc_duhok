import 'package:dc_duhok/core/functions/fcmconfig.dart';
import 'package:dc_duhok/core/services/services.dart';
import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.systemSharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }

  // requestPerLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Get.snackbar("تنبيه", "الرجاء تشغيل خدمو تحديد الموقع");
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Get.snackbar("تنبيه", "الرجاء اعطاء صلاحية الموقع للتطبيق");
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Get.snackbar("تنبيه", "لا يمكن استعمال التطبيق من دون اللوكيشين");
  //   }
  // }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmconfig();
    //requestPerLocation();
    String? sharedPrefLang =
        myServices.systemSharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
    } else if (sharedPrefLang == "he") {
      language = const Locale("he");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
