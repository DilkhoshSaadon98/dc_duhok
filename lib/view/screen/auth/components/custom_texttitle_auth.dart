import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String text;
  const CustomTextTitleAuth({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center, style: titleStyle.copyWith(fontSize: 20));
  }
}
