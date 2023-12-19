import 'package:dc_duhok/controller/start_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageListTile extends StatelessWidget {
  final String title;
  const LanguageListTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    StartController controller = Get.put(StartController());
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: primaryColor),
          borderRadius: BorderRadius.circular(constRadius)),
      child: ListTile(
        onTap: () async {
          await controller.chooseLanguage(title);
          await Get.offAndToNamed(AppRoute.onBoarding);
        },
        // ignore: prefer_const_constructors
        leading: Icon(
          Icons.edit,
          color: primaryColor,
        ),
        title: Text(
          title.tr,
          style: titleStyle.copyWith(color: primaryColor),
        ),
      ),
    );
  }
}
