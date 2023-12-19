import 'package:dc_duhok/core/class/statusrequest.dart';
import 'package:dc_duhok/core/localization/changelocal.dart';
import 'package:dc_duhok/core/services/services.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  LocaleController localeController = Get.find();
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? selectedLanguage;

  chooseLanguage(String val) {
    selectedLanguage = val;
    selectedLanguage == "en"
        ? localeController.changeLang('en')
        : selectedLanguage == "ar"
            ? localeController.changeLang('ar')
            : localeController.changeLang('he');
    update();
  }

  @override
  void onInit() {
    selectedLanguage = myServices.systemSharedPreferences.getString('lang');
    super.onInit();
  }
}
