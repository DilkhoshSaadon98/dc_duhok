import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:flutter/material.dart';

class TopCardCart extends StatelessWidget {
  final String messageOne;
  final String messageTow;
  final String itemsnum;
  const TopCardCart(
      {Key? key,
      required this.messageOne,
      required this.itemsnum,
      required this.messageTow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 40,
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(messageOne + itemsnum + messageTow,
          textAlign: TextAlign.center, style: titleStyle),
    );
  }
}
