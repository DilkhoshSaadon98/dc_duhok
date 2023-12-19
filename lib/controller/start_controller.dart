import 'package:dc_duhok/core/class/statusrequest.dart';
import 'package:dc_duhok/core/localization/changelocal.dart';
import 'package:get/get.dart';

class StartController extends GetxController {
  double continerHeight = 150;
  String? selectedLanguage;
  List<String> title = ['Arabic', 'English', 'Kurdish'];

  LocaleController localeController = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  changeHeight(val) {
    if (continerHeight > 150.0) {
      continerHeight = 150.0;
      update();
    }
    continerHeight = val;
    update();
  }

  chooseLanguage(String val) {
    selectedLanguage = val;
    selectedLanguage == "English"
        ? localeController.changeLang('en')
        : selectedLanguage == 'Arabic'
            ? localeController.changeLang('ar')
            : localeController.changeLang('iw');
    update();
  }
}
