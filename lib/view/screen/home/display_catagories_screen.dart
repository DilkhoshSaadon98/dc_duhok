import 'package:dc_duhok/controller/home_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/functions/translatefatabase.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DisplayAllCategories extends GetView<HomeControllerImp> {
  const DisplayAllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: customAppBarTitle('Catagories'.tr, true, true),
      body: Container(
        padding:
            EdgeInsets.symmetric(horizontal: constScreenPadding, vertical: 15),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 15),
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  controller.goToItems(controller.categories, index,
                      controller.categories[index]['catagories_id'].toString());
                },
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: myServices.sharedPreferences.getBool('mode') !=
                                  true
                              ? controller.listColorLight[
                                  index % controller.listColorLight.length]
                              : controller.listColorDark[
                                  index % controller.listColorDark.length],
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 85,
                      width: 85,
                      child: SvgPicture.network(
                        // ignore: deprecated_member_use
                        color:
                            myServices.sharedPreferences.getBool('mode') == true
                                ? darkCardColor
                                : primaryColor,
                        "${AppLink.imagestCategories}${controller.categories[index]['catagories_image']}",
                        //color: AppColor.black
                      ),
                    ),
                    customSizedBox(5),
                    Flexible(
                      child: Text(
                          "${translateDatabase(controller.categories[index]['catagories_name_ar'], controller.categories[index]['catagories_name'], controller.categories[index]['catagories_name_ku'])}",
                          style: bodyStyle),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
