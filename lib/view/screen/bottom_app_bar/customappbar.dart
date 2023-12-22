import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;
  final IconData iconData;
  final double? width;
  final FocusNode? focusNode;
  const CustomAppBar(
      {Key? key,
      required this.titleAppBar,
      this.onPressedSearch,
      this.onChanged,
      required this.mycontroller,
      this.iconData = Icons.favorite_border_outlined,
      this.width,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: width ?? Get.width,
      margin: const EdgeInsets.only(top: 15),
      child: TextFormField(
        focusNode: focusNode,
        controller: mycontroller,
        onChanged: onChanged,
        style: titleStyle.copyWith(
          letterSpacing: .7,
        ),
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                mycontroller.clear();
              },
              icon: const Icon(
                Icons.clear,
                color: Colors.redAccent,
              )),
          prefixIcon: Icon(
            Icons.search,
            color: myServices.sharedPreferences.getBool('mode') == true
                ? white
                : primaryColor,
          ),
          contentPadding: const EdgeInsets.only(top: 5, left: 10, right: 10),
          hintText: titleAppBar,
          hintStyle: bodyStyle.copyWith(
            fontSize: 15,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColor.secondColor, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(constRadius))),
          errorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColor.thirdColor, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(constRadius))),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: secondColor, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(constRadius))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: myServices.sharedPreferences.getBool('mode') == true
                      ? white
                      : primaryColor,
                  width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(constRadius))),
        ),
      ),
    );
  }
}
