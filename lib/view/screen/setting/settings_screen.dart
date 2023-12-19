import 'package:dc_duhok/controller/settings_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());

    return ListView(
      children: [
        Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
          Container(
            height: Get.height / 7,
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            color: myServices.sharedPreferences.getBool('mode') == true
                ? darkCardColor
                : primaryColor,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.center,
                appName,
                style: GoogleFonts.rubikIso(color: secondColor, fontSize: 35),
              ),
            ),
          ),
        ]),
        customSizedBox(5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            elevation: 5,
            shadowColor: const Color(0xff1B2430),
            color: myServices.sharedPreferences.getBool('mode') == true
                ? const Color(0xff1B2430)
                : white,
            shape: Border.all(width: .5, color: secondColor),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              //! App Theme :
              GetBuilder<SettingsController>(builder: (controller) {
                return ListTile(
                  trailing: Switch(
                    activeColor:
                        myServices.sharedPreferences.getBool('mode') == true
                            ? white
                            : primaryColor,
                    value: controller.myServices.sharedPreferences
                            .getBool('mode') ??
                        false,
                    onChanged: (_) {
                      controller.changeMode();
                    },
                  ),
                  title: Text(
                    "Dark Mode".tr,
                    style: titleStyle.copyWith(
                        color:
                            myServices.sharedPreferences.getBool('mode') != true
                                ? primaryColor
                                : white),
                  ),
                );
              }),
              //! Generate List For Display List Tiles :
              ...List.generate(
                myServices.sharedPreferences.getString('step') == '1'
                    ? controller.tileTitle.length - 1
                    : controller.tileTitle.length,
                (index) => ListTile(
                  onTap: index == 9
                      ? () {
                          controller.logout();
                        }
                      : controller.onTap[index],
                  trailing: Icon(
                    index == 6
                        ? FontAwesomeIcons.language
                        : controller.tileIconData[index],
                    color: myServices.sharedPreferences.getBool('mode') == true
                        ? white
                        : primaryColor,
                  ),
                  title: Text(
                    controller.tileTitle[index].tr,
                    style: titleStyle.copyWith(
                      color:
                          myServices.sharedPreferences.getBool('mode') != true
                              ? primaryColor
                              : white,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
        customSizedBox(),
        Center(
          child: Text(
            'Copyright ⓒ 2023 DC DUHOK',
            style: titleStyle,
          ),
        ),
        customSizedBox(30),
      ],
    );
  }
}
