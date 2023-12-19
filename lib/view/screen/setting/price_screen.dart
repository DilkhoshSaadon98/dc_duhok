import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceScreen extends StatelessWidget {
  const PriceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarTitle('Delivery Price'.tr),
      body: ListView(
        padding:
            EdgeInsets.symmetric(horizontal: constScreenPadding, vertical: 10),
        children: [
          Container(
            width: Get.width,
            height: 50,
            color: primaryColor,
            child: Text(
              'Delivery Price in Duhok',
              style: titleStyle.copyWith(color: secondColor),
            ),
          )
        ],
      ),
    );
  }
}
