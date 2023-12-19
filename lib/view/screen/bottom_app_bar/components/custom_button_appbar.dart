import 'package:dc_duhok/core/constant/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtonAppBar extends StatelessWidget {
  void Function()? onPressed;
  final String textbutton;
  final IconData icondata;
  final bool? active;
  CustomButtonAppBar(
      {Key? key,
      required this.textbutton,
      required this.icondata,
      this.onPressed,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      minWidth: 25,
      onPressed: onPressed,
      child: active == true
          ? CircleAvatar(
              backgroundColor: secondColor,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                icondata == Icons.abc
                    ? Container()
                    : Icon(icondata,
                        size: 25,
                        color: active == true ? primaryColor : secondColor),
                // Text(
                //   textbutton,
                //   style: bodyStyle.copyWith(
                //       fontSize: 12, color: active == true ? secondColor : white),
                //)
              ]),
            )
          : Column(mainAxisSize: MainAxisSize.min, children: [
              icondata == Icons.abc
                  ? Container()
                  : Icon(icondata,
                      size: 25,
                      color: active == true ? primaryColor : secondColor),
              // Text(
              //   textbutton,
              //   style: bodyStyle.copyWith(
              //       fontSize: 12, color: active == true ? secondColor : white),
              //)
            ]),
    );
  }
}
