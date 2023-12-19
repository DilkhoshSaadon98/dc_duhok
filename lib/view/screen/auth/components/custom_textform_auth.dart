import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? readOnly;
  final bool? obscureText;
  final bool? capitalizeText;
  final bool? isPassword;
  final void Function(String)? onChanged;
  final void Function()? onTapIcon;

  CustomTextFormAuth(
      {Key? key,
      this.obscureText,
      this.onTapIcon,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      this.mycontroller,
      required this.valid,
      required this.isNumber,
      this.isPassword,
      this.readOnly,
      this.capitalizeText,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: capitalizeText == true
          ? TextCapitalization.sentences
          : TextCapitalization.none,
      validator: valid,
      textInputAction: TextInputAction.next,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: isNumber == true ? TextInputType.phone : TextInputType.text,
      controller: mycontroller,
      style: titleStyle.copyWith(fontWeight: FontWeight.w100, fontSize: 15),
      textAlign: TextAlign.start,
      obscureText: isPassword == true ? true : false,
      readOnly: readOnly ?? false,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hinttext.tr,
        hintStyle: bodyStyle,
        alignLabelWithHint: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        label: Text(
          labeltext.tr,
          style: titleStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 15),
        ),
        prefixIcon: Icon(
          iconData,
          color: myServices.sharedPreferences.getBool('mode') == true
              ? white
              : primaryColor,
        ),
        suffixIcon: labeltext == "Password".tr
            ? IconButton(
                onPressed: onTapIcon,
                icon: isPassword == true
                    ? Icon(
                        Icons.visibility_outlined,
                        color:
                            myServices.sharedPreferences.getBool('mode') == true
                                ? white
                                : primaryColor,
                      )
                    : Icon(Icons.visibility_off_outlined,
                        color:
                            myServices.sharedPreferences.getBool('mode') == true
                                ? white
                                : primaryColor),
              )
            : null,
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.secondColor, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(constRadius))),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.thirdColor, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(constRadius))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.greenAccent, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: myServices.sharedPreferences.getBool('mode') == true
                    ? white
                    : primaryColor,
                width: 1),
            borderRadius: BorderRadius.all(Radius.circular(constRadius))),
      ),
    );
  }
}
