import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonCart extends StatelessWidget {
  final String textbutton;
  final String price;
  final void Function()? onPressed;
  const CustomButtonCart(
      {Key? key, required this.textbutton, this.onPressed, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 50,
        width: Get.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: fourthColor,
            borderRadius: BorderRadius.circular(constRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(textbutton, style: titleStyle.copyWith(color: secondColor)),
            Text(' - ( $price ${' IQ'.tr} )',
                style: titleStyle.copyWith(color: secondColor)),
          ],
        ),
      ),
    );
  }
}
