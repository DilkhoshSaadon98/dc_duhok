import 'package:dc_duhok/controller/address/view_controller.dart';
import 'package:dc_duhok/core/class/handlingdataview.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/constant/routes.dart';
import 'package:dc_duhok/core/functions/check_user_account.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/core/shared/custom_widget_gsture_back.dart';
import 'package:dc_duhok/view/screen/address/components/address_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
        appBar: customAppBarTitle('Address', true),
        floatingActionButton:
            myServices.sharedPreferences.getString('step') == '1'
                ? Container()
                : FloatingActionButton(
                    backgroundColor: secondColor,
                    onPressed: () {
                      Get.toNamed(AppRoute.addressadddetails);
                    },
                    child: Icon(
                      Icons.add,
                      color: primaryColor,
                    )),
        body: checkUserAccount(CustomWidgetBack(
          widget: Container(
            padding: EdgeInsets.symmetric(
                horizontal: constScreenPadding, vertical: 15),
            child: GetBuilder<AddressViewController>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, i) {
                    return CardAddress(
                      addressModel: controller.data[i],
                      onDelete: () {
                        controller.deleteAddress(
                            controller.data[i].addressId!.toString());
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        )));
  }
}
