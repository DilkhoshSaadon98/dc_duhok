import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethodCheckout(
      {Key? key, required this.title, required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
          color: isActive == true ? primaryColor : white,
          border: Border.all(color: primaryColor, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Text(title,
          style: titleStyle.copyWith(
              color: isActive == true ? secondColor : primaryColor,
              height: 1,
              fontSize: 16,
              fontWeight: FontWeight.bold)),
    );
  }
}
