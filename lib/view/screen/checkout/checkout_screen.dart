import 'package:dc_duhok/controller/checkout_controller.dart';
import 'package:dc_duhok/core/class/handlingdataview.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/constant/imgaeasset.dart';
import 'package:dc_duhok/core/constant/routes.dart';
import 'package:dc_duhok/core/functions/formating_numbers.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/core/shared/custom_card_style.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/core/shared/custom_snack_bar.dart';
import 'package:dc_duhok/view/screen/checkout/components/card_deliveery_type.dart';
import 'package:dc_duhok/view/screen/checkout/components/card_shipping_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());
    return Scaffold(
      appBar: customAppBarTitle('Checkout'.tr, true),
      bottomNavigationBar: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: customCardStyle(fourthColor, secondColor),
          child: GetBuilder<CheckoutController>(builder: (controller) {
            return MaterialButton(
              height: 50,
              color: fourthColor,
              textColor: secondColor,
              onPressed: () {
                controller.checkout();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Checkout".tr,
                      style: titleStyle.copyWith(color: secondColor)),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("( ${formattingNumbers(controller.totalPrice)})",
                      style: numberStyle.copyWith(color: secondColor)),
                ],
              ),
            );
          })),
      body: GetBuilder<CheckoutController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      Text(
                        "Choose Payment Method:".tr,
                        style: titleStyle.copyWith(fontSize: 18),
                      ),
                      customSizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              controller
                                  .choosePaymentMethod("0"); // 0 => Delivery
                            },
                            child: CardDeliveryTypeCheckout(
                                imagename: AppImageAsset.cashOnDelivery,
                                title: "Cash On Delivery".tr,
                                active: controller.paymentMethod == "0"
                                    ? true
                                    : false),
                          ),
                          const SizedBox(width: 10),
                          // TODO_Maybe Later :
                          InkWell(
                            onTap: () {
                              //  controller.choosePaymentMethod("1");
                              customSnackBar('Sorry'.tr,
                                  'Coming soon stay tuned'.tr); // 0 => Delivery
                            },
                            child: CardDeliveryTypeCheckout(
                                imagename: AppImageAsset.paymentsCard,
                                title: "Payments Card".tr,
                                active: controller.paymentMethod == "1" // Card
                                    ? true
                                    : false),
                          ),
                        ],
                      ),
                      customSizedBox(50),
                      Text(
                        "Choose Delivery Type".tr,
                        style: titleStyle.copyWith(fontSize: 18),
                      ),
                      customSizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              controller
                                  .chooseDeliveryType("0"); // 0 => Delivery
                            },
                            child: CardDeliveryTypeCheckout(
                                imagename: AppImageAsset.deliveryImage2,
                                title: "Delivery".tr,
                                active: controller.deliveryType == "0"
                                    ? true
                                    : false),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("1"); // 1 => recive
                            },
                            child: CardDeliveryTypeCheckout(
                                imagename: AppImageAsset.drivethruImage,
                                title: "Revice".tr,
                                active: controller.deliveryType == "1"
                                    ? true
                                    : false),
                          ),
                        ],
                      ),
                      customSizedBox(40),
                      if (controller.deliveryType == "0")
                        controller.dataaddress.isEmpty
                            ? Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'Please add address . . .'.tr,
                                      style: titleStyle,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: primaryColor,
                                      child: IconButton(
                                          onPressed: () {
                                            Get.toNamed(
                                                AppRoute.addressadddetails);
                                          },
                                          icon: const Icon(
                                            Icons.location_on,
                                            color: secondColor,
                                          )),
                                    )
                                  ],
                                ),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customSizedBox(),
                                  Text(
                                    "Shipping Address".tr,
                                    style: titleStyle.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  customSizedBox(10),
                                  ...List.generate(
                                    controller.dataaddress.length,
                                    (index) => InkWell(
                                      onTap: () {
                                        controller.getShippingAddress(index);
                                        controller.chooseShippingAddress(
                                          controller
                                              .dataaddress[index].addressId!
                                              .toString(),
                                        );
                                      },
                                      child: CardShppingAddressCheckout(
                                          shippingPrice: controller.cities[
                                              controller.dataaddress[index]
                                                  .addressCity]!,
                                          title:
                                              "${controller.dataaddress[index].addressName}",
                                          body:
                                              "${controller.dataaddress[index].addressCity} - ${controller.dataaddress[index].addressRegion} - ${controller.dataaddress[index].addressStreet}",
                                          isactive: controller.addressid ==
                                                  controller.dataaddress[index]
                                                      .addressId
                                                      .toString()
                                              ? true
                                              : false),
                                    ),
                                  )
                                ],
                              )
                    ],
                  )))),
    );
  }
}
