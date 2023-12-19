import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonCoupon extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonCoupon({Key? key, required this.textbutton, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      width: double.infinity,
      child: MaterialButton(
        color: fourthColor,
        textColor: secondColor,
        onPressed: onPressed,
        child: Text(textbutton, style: titleStyle.copyWith(color: secondColor)),
      ),
    );
  }
}
