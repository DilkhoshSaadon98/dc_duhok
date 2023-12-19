import 'package:dc_duhok/controller/favorite_controller.dart';
import 'package:dc_duhok/controller/items/items_controller.dart';
import 'package:dc_duhok/core/class/handlingdataview.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/core/shared/custom_widget_gsture_back.dart';
import 'package:dc_duhok/data/model/items_model.dart';
import 'package:dc_duhok/view/screen/search/components/list_items_search.dart';
import 'package:dc_duhok/view/screen/bottom_app_bar/customappbar.dart';
import 'package:dc_duhok/view/screen/items/components/custom_list_items.dart';
import 'package:dc_duhok/view/screen/items/components/list_categoirse_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
        appBar: customAppBarTitle('Products'.tr, true, true),
        body: CustomWidgetBack(
          widget: Container(
            padding: EdgeInsets.symmetric(horizontal: constScreenPadding),
            child: GetBuilder<ItemsControllerImp>(builder: (controller) {
              return ListView(children: [
                CustomAppBar(
                  focusNode: controller.textFieldFocusNode,
                  mycontroller: controller.search!,
                  titleAppBar: "Search For Product . . .".tr,
                  onPressedSearch: () {
                    controller.onSearchItems();
                    controller.search!.clear();
                  },
                  onChanged: (val) {
                    //  controller.checkSearch(val);
                    controller.onSearchItems();
                    controller.checkSearch(val);
                  },
                ),
                customSizedBox(20),
                !controller.isSearch
                    ? const ListCategoriesItems()
                    : Container(),
                !controller.isSearch ? customSizedBox(20) : Container(),
                GetBuilder<ItemsControllerImp>(
                    builder: (controller) => HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: !controller.isSearch
                            ? GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: .75.h,
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10.h,
                                        crossAxisSpacing: 10.w),
                                itemCount: controller.data.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, index) {
                                  controllerFav.isFavorite[
                                          controller.data[index]['items_id']] =
                                      controller.data[index]['favorite'];
                                  //   return Text(index.toString());
                                  return CustomListItems(
                                      itemsModel: ItemsModel.fromJson(
                                          controller.data[index]));
                                })
                            : ListItemsSearch(
                                listdatamodel: controller.listdataSearch)))
              ]);
            }),
          ),
        ));
  }
}
