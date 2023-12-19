import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/shared/custom_card_style.dart';
import 'package:flutter/material.dart';

class CardDeliveryTypeCheckout extends StatelessWidget {
  final String imagename;
  final String title;
  final bool active;
  const CardDeliveryTypeCheckout(
      {Key? key,
      required this.imagename,
      required this.title,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: customCardStyle(
          active ? primaryColor.withOpacity(.8) : cartColor,
          active == true ? secondColor : primaryColor.withOpacity(.8),
          myServices.sharedPreferences.getBool('mode') == true
              ? white
              : primaryColor.withOpacity(.8)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          imagename,
          width: 60,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: titleStyle.copyWith(
              fontSize: 13,
              color: active
                  ? secondColor
                  : myServices.sharedPreferences.getBool('mode') == true
                      ? white
                      : primaryColor,
              fontWeight: FontWeight.w500),
        )
      ]),
    );
  }
}
