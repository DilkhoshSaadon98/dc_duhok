// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dc_duhok/controller/orders/details_controller.dart';
import 'package:dc_duhok/core/class/handlingdataview.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/functions/formating_numbers.dart';
import 'package:dc_duhok/core/functions/translatefatabase.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/core/shared/custom_card_style.dart';
import 'package:dc_duhok/core/shared/custom_divider.dart';
import 'package:dc_duhok/core/shared/custom_widget_gsture_back.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
        appBar: customAppBarTitle('Order Details'.tr, true),
        body: CustomWidgetBack(
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GetBuilder<OrdersDetailsController>(
                builder: ((controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView(children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: myServices.sharedPreferences
                                            .getBool('mode') ==
                                        true
                                    ? white
                                    : primaryColor),
                            borderRadius: BorderRadius.circular(constRadius)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 5),
                          child: Column(
                            children: [
                              Table(
                                children: [
                                  TableRow(children: [
                                    Column(
                                      children: [
                                        Text("Items".tr,
                                            textAlign: TextAlign.center,
                                            style: titleStyle.copyWith(
                                              fontSize: 16,
                                            )),
                                        customDivider()
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("QTY".tr,
                                            textAlign: TextAlign.center,
                                            style: titleStyle.copyWith(
                                              fontSize: 16,
                                            )),
                                        customDivider()
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("Price".tr,
                                            textAlign: TextAlign.center,
                                            style: titleStyle.copyWith(
                                              fontSize: 16,
                                            )),
                                        customDivider()
                                      ],
                                    ),
                                  ]),
                                  ...List.generate(
                                      controller.data.length,
                                      (index) => TableRow(children: [
                                            Text(
                                              "${translateDatabase(controller.data[index].itemsNameAr, controller.data[index].itemsName, controller.data[index].itemsNameKu)}",
                                              textAlign: TextAlign.center,
                                              style: bodyStyle.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "${controller.data[index].countitems}",
                                              textAlign: TextAlign.center,
                                              style: numberStyle.copyWith(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                                formattingNumbers(int.parse(
                                                    controller.data[index]
                                                        .itemsprice!)),
                                                textAlign: TextAlign.center,
                                                style: numberStyle.copyWith(
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ]))
                                ],
                              ),
                              SizedBox(height: 10),
                              customDivider(),
                              SizedBox(height: 5),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Total Price".tr,
                                        textAlign: TextAlign.center,
                                        style: titleStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        formattingNumbers(controller
                                            .ordersModel.ordersTotalprice!),
                                        textAlign: TextAlign.center,
                                        style: numberStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // //! If Address Not Selected :
                      if (controller.ordersModel.ordersType == 0)
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration:
                              customCardStyle(primaryColor, secondColor),
                          child: ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(controller.ordersModel.addressCity!,
                                    style: titleStyle.copyWith(
                                        color: secondColor)),
                              ),
                              subtitle: Text(
                                "${controller.ordersModel.addressRegion} - ${controller.ordersModel.addressStreet}",
                                style: bodyStyle.copyWith(color: secondColor),
                              ),
                              trailing: Text(
                                  controller.ordersModel.addressName!,
                                  style:
                                      titleStyle.copyWith(color: secondColor)),
                              leading: Icon(
                                FontAwesomeIcons.locationArrow,
                                color: secondColor,
                              )),
                        ),
                      // if (controller.ordersModel.ordersType == 0)
                      //   Card(
                      //     child: Container(
                      //       padding:
                      //           EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      //       height: 300,
                      //       width: double.infinity,
                      //       child: GoogleMap(
                      //         mapType: MapType.normal,
                      //         markers: controller.markers.toSet(),
                      //         initialCameraPosition: controller.cameraPosition!,
                      //         onMapCreated: (GoogleMapController controllermap) {
                      //           controller.completercontroller!
                      //               .complete(controllermap);
                      //         },
                      //       ),
                      //     ),
                      //   )
                    ])))),
          ),
        ));
  }
}
