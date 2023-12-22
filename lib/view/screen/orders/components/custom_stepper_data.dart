import 'package:another_stepper/dto/stepper_data.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:flutter/material.dart';

StepperData customStepperData(
  String title,
  String subTitle,
  bool active,
  IconData iconData,
) {
  return StepperData(
      title: StepperText(title,
          textStyle: titleStyle.copyWith(
              color: active == true ? secondColor : primaryColor)),
      subtitle: StepperText(subTitle,
          textStyle: bodyStyle.copyWith(
              color: active == true ? secondColor : primaryColor)),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: active == true ? secondColor : primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(constRadius))),
        child:
            Icon(iconData, color: active != true ? secondColor : primaryColor),
      ));
}
