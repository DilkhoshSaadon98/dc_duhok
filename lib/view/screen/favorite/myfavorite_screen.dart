import 'package:dc_duhok/controller/myfavorite_controller.dart';
import 'package:dc_duhok/core/class/handlingdataview.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/functions/check_user_account.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/core/shared/custom_widget_gsture_back.dart';
import 'package:dc_duhok/view/screen/bottom_app_bar/customappbar.dart';
import 'package:dc_duhok/view/screen/favorite/components/custom_list_favorite_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());

    return Scaffold(
        appBar: customAppBarTitle('Favorite'.tr, true),
        body: CustomWidgetBack(
            widget: checkUserAccount(
          Container(
            padding: EdgeInsets.symmetric(horizontal: constScreenPadding),
            child: GetBuilder<MyFavoriteController>(
                builder: ((controller) => ListView(children: [
                      CustomAppBar(
                        mycontroller: controller.search!,
                        titleAppBar: "Search For Product . . .".tr,
                        iconData: Icons.arrow_forward,
                        // onPressedIcon: () {},
                        onPressedSearch: () {
                          controller.onSearchItems();
                        },
                        onChanged: (val) {
                          controller.checkSearch(val);
                        },
                      ),
                      customSizedBox(),
                      HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing: 15,
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.75),
                            itemBuilder: (context, index) {
                              return CustomListFavoriteItems(
                                  itemsModel: controller.data[index]);
                            },
                          ))
                    ]))),
          ),
        )));
  }
}
