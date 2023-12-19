import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/functions/formating_numbers.dart';
import 'package:dc_duhok/core/shared/custom_card_style.dart';
import 'package:flutter/material.dart';

class CardShppingAddressCheckout extends StatelessWidget {
  final String title;
  final String body;
  final bool isactive;
  final int shippingPrice;
  const CardShppingAddressCheckout(
      {Key? key,
      required this.title,
      required this.body,
      required this.isactive,
      required this.shippingPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: customCardStyle(
          isactive ? primaryColor : cartColor,
          isactive == true ? secondColor : primaryColor,
          isactive ? secondColor : primaryColor),
      // color: isactive ? primaryColor : Colors.white,
      // elevation: 10,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(
          Icons.location_on,
          color: isactive
              ? secondColor
              : myServices.sharedPreferences.getBool('mode') == true
                  ? white
                  : primaryColor,
        ),
        title: Text(title,
            style: titleStyle.copyWith(
                fontSize: 16,
                color: isactive
                    ? AppColor.secondColor
                    : myServices.sharedPreferences.getBool('mode') == true
                        ? white
                        : primaryColor,
                fontWeight: FontWeight.w700)),
        subtitle: Text(body,
            style: bodyStyle.copyWith(
                fontSize: 12,
                color: isactive
                    ? AppColor.secondColor
                    : myServices.sharedPreferences.getBool('mode') == true
                        ? white
                        : primaryColor,
                fontWeight: FontWeight.w100)),
        trailing: Text(
          formattingNumbers(shippingPrice),
          style: bodyStyle.copyWith(color: secondColor),
        ),
      ),
    );
  }
}
