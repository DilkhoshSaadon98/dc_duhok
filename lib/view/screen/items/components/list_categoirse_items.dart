import 'package:dc_duhok/controller/items/items_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/functions/translatefatabase.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/data/model/categories_model.dart';
import 'package:dc_duhok/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel:
                CatagoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CatagoriesModel categoriesModel;
  final int? i;
  const Categories({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i!, categoriesModel.catagoriesId!);
      },
      child: GetBuilder<ItemsControllerImp>(builder: (controller) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: .5, color: secondColor),
                  color: myServices.sharedPreferences.getBool('mode') == true
                      ? darkCardColor
                      : primaryColor,
                  borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 70,
              width: 70,
              child: SvgPicture.network(
                // ignore: deprecated_member_use
                color: controller.selectedCat == i ? secondColor : white,
                "${AppLink.imagestCategories}${categoriesModel.catagoriesImage}",
              ),
            ),
            customSizedBox(5),
            Container(
              padding: const EdgeInsets.only(right: 10, left: 10, bottom: 2),
              decoration: controller.selectedCat == i
                  ? BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 2,
                              color: controller.selectedCat == i
                                  ? AppColor.secondColor
                                  : primaryColor)))
                  : null,
              child: Text(
                "${translateDatabase(categoriesModel.catagoriesNamaAr, categoriesModel.catagoriesName, categoriesModel.catagoriesNamaKu)}",
                style: titleStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: controller.selectedCat == i
                        ? AppColor.secondColor
                        : myServices.sharedPreferences.getBool('mode') == true
                            ? white
                            : primaryColor),
              ),
            )
          ],
        );
      }),
    );
  }
}
