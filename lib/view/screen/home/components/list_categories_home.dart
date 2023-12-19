import 'package:dc_duhok/controller/home_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/functions/translatefatabase.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/data/model/categories_model.dart';
import 'package:dc_duhok/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            itemColor: myServices.sharedPreferences.getBool('mode') == true
                ? controller
                    .listColorDark[index % controller.listColorDark.length]
                : controller
                    .listColorLight[index % controller.listColorLight.length],
            i: index,
            categoriesModel:
                CatagoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CatagoriesModel categoriesModel;
  final int? i;
  final Color? itemColor;
  const Categories({
    Key? key,
    required this.categoriesModel,
    required this.i,
    required this.itemColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories, i!,
            categoriesModel.catagoriesId!.toString());
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: itemColor,
                borderRadius: BorderRadius.circular(constRadius)),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            height: 70.h,
            width: 70.w,
            child: SvgPicture.network(
              // ignore: deprecated_member_use
              color: darkCardColor,
              "${AppLink.imagestCategories}${categoriesModel.catagoriesImage}",
              //color: AppColor.black
            ),
          ),
          customSizedBox(5),
          Text(
              "${translateDatabase(categoriesModel.catagoriesNamaAr, categoriesModel.catagoriesName, categoriesModel.catagoriesNamaKu)}",
              style: bodyStyle)
        ],
      ),
    );
  }
}
