import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigleRowOrdersItems extends StatelessWidget {
  final String? title;
  final String? data;
  final bool? isNum;
  const SigleRowOrdersItems({super.key, this.title, this.data, this.isNum});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title!.tr,
              style: bodyStyle.copyWith(fontWeight: FontWeight.w600)),
          Text(data!.tr,
              style: isNum == true
                  ? numberStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w600)
                  : bodyStyle.copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
