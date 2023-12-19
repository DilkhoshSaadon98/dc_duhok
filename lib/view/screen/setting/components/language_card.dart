import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/shared/custom_card_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageCard extends StatelessWidget {
  final String imagename;
  final String title;
  final bool active;
  const LanguageCard(
      {Key? key,
      required this.imagename,
      required this.title,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      //  margin: EdgeInsets.symmetric(horizontal: constScreenPadding),
      padding: EdgeInsets.symmetric(
        horizontal: constScreenPadding,
      ),
      decoration: customCardStyle(
          active == true
              ? darkCardColor
              : myServices.sharedPreferences.getBool('mode') != true
                  ? white
                  : black,
          myServices.sharedPreferences.getBool('mode') == true && active == true
              ? secondColor
              : white),
      child: Row(
        mainAxisAlignment: active == true
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        children: [
          Text(title.tr,
              style: titleStyle.copyWith(
                  color: active == true
                      ? AppColor.secondColor
                      : myServices.sharedPreferences.getBool('mode') == true
                          ? white
                          : primaryColor,
                  height: 1,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          active == true
              ? const Icon(
                  Icons.check,
                  color: AppColor.secondColor,
                )
              : Container()
        ],
      ),
    );
  }
}
