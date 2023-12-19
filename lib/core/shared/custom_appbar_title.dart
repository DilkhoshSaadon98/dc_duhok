import 'package:dc_duhok/controller/cart_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar customAppBarTitle(
  String title, [
  bool? isSubScreen,
  bool? showBadge = false,
]) {
  Get.put(CartController());
  return AppBar(
    actions: [
      showBadge == true
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Badge(
                label: GetBuilder<CartController>(builder: (controller) {
                  return Text(
                    controller.totalcountitems.toString(),
                  );
                }),
                child: IconButton(
                  icon: const Icon(
                    size: 30,
                    Icons.shopping_cart_outlined,
                  ),
                  onPressed: () {
                    Get.toNamed(AppRoute.cart);
                  },
                ),
              ),
            )
          : Container()
    ],
    leading: isSubScreen == true
        ? GestureDetector(
            onLongPress: () {
              Get.toNamed(AppRoute.homepage);
            },
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColor.secondColor,
                )),
          )
        : Container(),
    centerTitle: true,
    elevation: 10,
    scrolledUnderElevation: 1,
    title: Text(
      title,
      style: titleStyle.copyWith(color: secondColor, fontSize: 22),
    ),
  );
}
