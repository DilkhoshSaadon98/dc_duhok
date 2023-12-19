import 'package:dc_duhok/controller/search_controller.dart';
import 'package:dc_duhok/core/class/handlingdataview.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/view/screen/search/components/list_items_search.dart';
import 'package:dc_duhok/view/screen/bottom_app_bar/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchMixController());
    return Scaffold(
      appBar: customAppBarTitle('Search', false, true),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: constScreenPadding),
        child: GetBuilder<SearchMixController>(builder: (controller) {
          return ListView(
            children: [
              CustomAppBar(
                //  width: Get.width * .75,
                mycontroller: controller.search!,
                titleAppBar: "Search For Product . . .".tr,
                // onPressedIcon: () {},
                onPressedSearch: () {
                  controller.onSearchItems();
                  controller.search!.clear();
                },
                onChanged: (val) {
                  controller.onSearchItems();
                  // controller.checkSearch(val);
                },
              ),
              customSizedBox(),
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget:
                      ListItemsSearch(listdatamodel: controller.listdataSearch))
            ],
          );
        }),
      ),
    );
  }
}
