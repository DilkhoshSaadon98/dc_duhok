import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/functions/formating_numbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceAndCountItems extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final int price;
  final int count;
  const PriceAndCountItems(
      {Key? key,
      required this.onAdd,
      required this.onRemove,
      required this.price,
      required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalPrice = price * count;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: onAdd,
                icon: Icon(
                  Icons.add,
                  color: myServices.sharedPreferences.getBool('mode') == true
                      ? Colors.green
                      : primaryColor,
                )),
            Container(
                alignment: Alignment.center,
                width: 50,
                child: Text(
                  count.toString(),
                  style: numberStyle.copyWith(fontSize: 20, height: 1.1),
                )),
            IconButton(
                onPressed: onRemove,
                icon: const Icon(
                  Icons.remove,
                  color: Colors.red,
                )),
            const Spacer(),
            Text(formattingNumbers(price),
                style: numberStyle.copyWith(
                  fontSize: 18,
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Price'.tr,
              style: titleStyle.copyWith(
                fontSize: 18,
              ),
            ),
            Text(formattingNumbers(totalPrice),
                style: numberStyle.copyWith(
                  fontSize: 18,
                  color: secondColor,
                ))
          ],
        )
      ],
    );
  }
}
