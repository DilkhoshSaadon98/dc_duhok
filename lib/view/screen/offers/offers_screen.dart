import 'package:dc_duhok/controller/favorite_controller.dart';
import 'package:dc_duhok/controller/offers_controller.dart';
import 'package:dc_duhok/core/class/handlingdataview.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/core/shared/custom_widget_gsture_back.dart';
import 'package:dc_duhok/data/model/items_model.dart';
import 'package:dc_duhok/view/screen/offers/components/custom_list_item_offers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    Get.put(FavoriteController());
    // SearchMixController searchController = Get.put(SearchMixController());
    return Scaffold(
        appBar: customAppBarTitle("Offers".tr, true),
        body: CustomWidgetBack(
          widget: GetBuilder<OffersController>(builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: constScreenPadding, vertical: 10),
              child: HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: SizedBox(
                    height: Get.height,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: .75),
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          return CustomListItemsOffers(
                            itemIndex: index,
                            itemsModel:
                                ItemsModel.fromJson(controller.data[index]),
                          );
                        }),
                  )
                  //ListItemsSearch(listdatamodel: controller.data[1])

                  ),
            );
          }),
        ));
  }
}
