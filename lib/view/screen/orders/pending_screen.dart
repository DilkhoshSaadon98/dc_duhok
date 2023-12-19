import 'package:dc_duhok/controller/orders/pending_controller.dart';
import 'package:dc_duhok/core/class/handlingdataview.dart';
import 'package:dc_duhok/core/functions/check_user_account.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/core/shared/custom_widget_gsture_back.dart';
import 'package:dc_duhok/view/screen/orders/components/orders_list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Scaffold(
        appBar: customAppBarTitle('Pending Orders'.tr, true),
        body: checkUserAccount(CustomWidgetBack(
            widget: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: GetBuilder<OrdersPendingController>(
              builder: ((controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) {
                      return CardOrdersList(
                          listdata: controller.data[index], index);
                    }),
                  )))),
        ))));
  }
}
