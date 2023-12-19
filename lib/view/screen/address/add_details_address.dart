import 'package:dc_duhok/controller/address/adddetails_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/functions/validinput.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/core/shared/custom_button_global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth/components/custom_textform_auth.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List cities = [
      'Duhok Center',
      'Around Duhok',
      'Hawler',
      'Sulimanya',
      'Baghdad',
      'Mousel'
    ];
    AddAddressDetailsController controller =
        Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: customAppBarTitle('Add Address'.tr, true),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: constScreenPadding),
        child: CustomButtonGlobal(
          text1: "Save Address".tr,
          onPressed: () {
            controller.addAddress();
          },
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<AddAddressDetailsController>(
              builder: (controller) => Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      // CustomTextFormAuth(
                      //     hinttext: "City",
                      //     labeltext: "City",
                      //     iconData: Icons.location_city,
                      //     mycontroller: controller.city,
                      //     valid: (val) => validInput(val!, 1, 50, ''),
                      //     isNumber: false),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        width: Get.width,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(constRadius),
                            border: Border.all(width: 1, color: primaryColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_city_outlined,
                              color: primaryColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            DropdownButton<String>(
                              style: titleStyle,
                              icon: Container(),
                              value: controller.selectedCity,
                              onChanged: (String? newValue) {
                                controller.changeCity(newValue!);
                              },
                              items: cities
                                  .map<DropdownMenuItem<String>>((var city) {
                                return DropdownMenuItem<String>(
                                  value: city,
                                  child: Text(city),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      customSizedBox(),
                      CustomTextFormAuth(
                          hinttext: "Region",
                          labeltext: "Region",
                          iconData: Icons.location_city_outlined,
                          mycontroller: controller.moreInfo,
                          valid: (val) => validInput(val!, 1, 50, ''),
                          isNumber: false),
                      customSizedBox(),
                      CustomTextFormAuth(
                          hinttext: "Street",
                          labeltext: "Street",
                          iconData: Icons.streetview,
                          mycontroller: controller.street,
                          valid: (val) => validInput(val!, 1, 50, ''),
                          isNumber: false),
                      customSizedBox(),
                      CustomTextFormAuth(
                          hinttext: "Home / Work",
                          labeltext: "Address Title",
                          iconData: Icons.near_me,
                          mycontroller: controller.name,
                          valid: (val) => validInput(val!, 1, 50, ''),
                          isNumber: false),
                      customSizedBox(),
                    ]),
                  ))),
    );
  }
}
