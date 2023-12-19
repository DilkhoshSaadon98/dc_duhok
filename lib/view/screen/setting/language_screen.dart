import 'package:dc_duhok/controller/language_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/constant/imgaeasset.dart';
import 'package:dc_duhok/core/localization/changelocal.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/core/shared/custom_widget_gsture_back.dart';
import 'package:dc_duhok/view/screen/setting/components/language_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends GetView<LocaleController> {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LanguageController());
    //  LocaleController localeController =  Get.put(LocaleController());
    return Scaffold(
        appBar: customAppBarTitle('Language'.tr, true),
        body: CustomWidgetBack(
          widget: Container(
            color: myServices.sharedPreferences.getBool('mode') != true
                ? white
                : black,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   'Choose Your Language',
                //   style: titleStyle.copyWith(fontSize: 18),
                // ),
                customSizedBox(),
                GetBuilder<LanguageController>(builder: (controller) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.chooseLanguage("en");
                        },
                        child: LanguageCard(
                            imagename: AppImageAsset.deliveryImage2,
                            title: "English",
                            active: controller.selectedLanguage == "en"
                                ? true
                                : false),
                      ),
                      customSizedBox(),
                      InkWell(
                        onTap: () {
                          controller.chooseLanguage("ar");
                        },
                        child: LanguageCard(
                            imagename: AppImageAsset.deliveryImage2,
                            title: "Arabic",
                            active: controller.selectedLanguage == "ar"
                                ? true
                                : false),
                      ),
                      customSizedBox(),
                      InkWell(
                        onTap: () {
                          controller.chooseLanguage("he");
                        },
                        child: LanguageCard(
                            imagename: AppImageAsset.deliveryImage2,
                            title: "Kurdish",
                            active: controller.selectedLanguage == "he"
                                ? true
                                : false),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ));
  }
}
