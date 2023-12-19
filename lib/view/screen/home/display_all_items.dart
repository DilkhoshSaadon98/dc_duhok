import 'package:dc_duhok/controller/items/show_items.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/data/model/items_model.dart';
import 'package:dc_duhok/view/screen/bottom_app_bar/customappbar.dart';
import 'package:dc_duhok/view/screen/home/components/custom_display_items_home.dart';
import 'package:dc_duhok/view/screen/items/components/custom_list_items.dart';
import 'package:dc_duhok/view/screen/search/components/list_items_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DisplayAllItems extends GetView<ShowItemsControllerImp> {
  const DisplayAllItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ShowItemsControllerImp());
    return Scaffold(
      appBar: customAppBarTitle('Products'.tr, true, true),
      body: Container(
        padding:
            EdgeInsets.symmetric(horizontal: constScreenPadding, vertical: 15),
        child: GetBuilder<ShowItemsControllerImp>(builder: (controller) {
          return ListView(
            children: [
              CustomAppBar(
                mycontroller: controller.search!,
                titleAppBar: "Search For Product . . .".tr,
                onPressedSearch: () {
                  controller.onSearchItems();
                  controller.search!.clear();
                },
                onChanged: (val) {
                  controller.onSearchItems();
                  controller.checkSearch(val);
                },
              ),
              GetBuilder<ShowItemsControllerImp>(builder: (controller) {
                return !controller.isSearch
                    ? GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2,
                            childAspectRatio: .75.h),
                        itemCount: controller.data.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CustomListItems(
                              itemsModel:
                                  ItemsModel.fromJson(controller.data[index]));
                        })
                    : ListItemsSearch(listdatamodel: controller.listdataSearch);
              })
            ],
          );
        }),
      ),
    );
  }
}
