import 'package:dc_duhok/controller/orders/archive_controller.dart';
import 'package:dc_duhok/core/class/handlingdataview.dart';
import 'package:dc_duhok/core/functions/check_user_account.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/view/screen/orders/components/orders_list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return Scaffold(
        appBar: customAppBarTitle('Archive Orders'.tr, true),
        body: checkUserAccount(Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: GetBuilder<OrdersArchiveController>(
              builder: ((controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) => CardOrdersList(
                        listdata: controller.data[index], index)),
                  )))),
        )));
  }
}
