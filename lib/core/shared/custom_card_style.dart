import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:flutter/widgets.dart';

BoxDecoration customCardStyle(Color backClor, Color borderColor,
    [Color? shadowColor]) {
  return BoxDecoration(
    color: backClor,
    borderRadius: BorderRadius.circular(constRadius),
    border: Border.all(color: borderColor, width: .5),
    boxShadow: [
      BoxShadow(
        spreadRadius: .3,
        offset: Offset.fromDirection(BorderSide.strokeAlignOutside),
        blurRadius: 1,
        color: shadowColor ?? backClor,
      )
    ],
  );
}
