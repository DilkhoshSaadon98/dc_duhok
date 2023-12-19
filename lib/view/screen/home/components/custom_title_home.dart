// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitleHome extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const CustomTitleHome({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: titleStyle.copyWith(
                  fontSize: 20.sp,
                )),
            Icon(
              Icons.dashboard_outlined,
              color: myServices.sharedPreferences.getBool('mode') == true
                  ? secondColor
                  : primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
