import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomWidgetBack extends StatelessWidget {
  final Widget widget;
  const CustomWidgetBack({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: ((details) {
        if (details.localPosition.dx > 120) {
      //    Get.back();
        }
      }),
      child: widget,
    );
  }
}
