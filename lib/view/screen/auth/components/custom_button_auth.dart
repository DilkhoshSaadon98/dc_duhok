import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtomAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtomAuth({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Get.width,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: MaterialButton(
        height: 50,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(constRadius)),
        onPressed: onPressed,
        color: primaryColor,
        textColor: secondColor,
        child: Text(text, style: titleStyle.copyWith(color: secondColor)),
      ),
    );
  }
}
