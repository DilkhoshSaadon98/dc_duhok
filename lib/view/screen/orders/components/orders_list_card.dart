import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:dc_duhok/controller/orders/pending_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/constant/routes.dart';
import 'package:dc_duhok/core/functions/formating_numbers.dart';
import 'package:dc_duhok/core/shared/custom_divider.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/data/model/orders_model.dart';
import 'package:dc_duhok/view/screen/orders/components/custom_stepper_data.dart';
import 'package:dc_duhok/view/screen/orders/components/single_row_orders_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  final int index;

  const CardOrdersList(this.index, {Key? key, required this.listdata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersPendingController controller = Get.put(OrdersPendingController());
    List<StepperData> stepperData = [
      customStepperData('Accepted', 'Your order accepted',
          listdata.ordersStatus == 1 ? true : false, Icons.looks_one_outlined),
      customStepperData('Preapare', 'Your order under preapare',
          listdata.ordersStatus == 2 ? true : false, Icons.looks_two_outlined),
      customStepperData('Delivered', 'Your order on the way',
          listdata.ordersStatus == 3 ? true : false, Icons.looks_3_outlined),
      customStepperData('Done', 'Your order Done Success',
          listdata.ordersStatus == 4 ? true : false, Icons.looks_4_outlined),
    ];
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: 15, vertical: constScreenPadding),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: myServices.sharedPreferences.getBool('mode') != true
            ? white
            : black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: myServices.sharedPreferences.getBool('mode') == true
                ? white
                : primaryColor,
            width: .5),
        // boxShadow: [
        //   BoxShadow(
        //     spreadRadius: 1,
        //     offset: Offset.fromDirection(BorderSide.strokeAlignOutside),
        //     blurRadius: 1,
        //     color: primaryColor,
        //   )
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Order".tr,
                  style: titleStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              Text(": #${(index + 1)}",
                  style: titleStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const Spacer(),
              Text(
                Jiffy(listdata.ordersDatetime, "yyyy-MM-dd")
                    .yMd
                    .toString()
                    .capitalize!,
                style: numberStyle.copyWith(
                    color: AppColor.secondColor, fontWeight: FontWeight.w500),
              )
            ],
          ),
          customSizedBox(5),
          customDivider(),
          AnotherStepper(
            barThickness: 3,
            activeIndex: 2,
            activeBarColor: secondColor,
            inActiveBarColor: primaryColor,
            stepperList: stepperData,
            stepperDirection: Axis.horizontal,
            iconWidth: 40,
            iconHeight: 40,
          ),
          customSizedBox(),
          SigleRowOrdersItems(
              title: "Order Type",
              data:
                  " ${controller.printOrderType(listdata.ordersType!.toString())}"),
          SigleRowOrdersItems(
              title: "Order Price",
              data: " ${formattingNumbers(listdata.ordersPrice!)}",
              isNum: true),
          SigleRowOrdersItems(
              title: "Delivery Price",
              data: " ${formattingNumbers(listdata.ordersPricedelivery!)}",
              isNum: true),
          GetBuilder<OrdersPendingController>(builder: (controller) {
            return SigleRowOrdersItems(
              title: "Payment Method",
              data:
                  " ${controller.printPaymentMethod(listdata.ordersPaymentmethod.toString())}",
            );
          }),
          customDivider(),
          Row(
            children: [
              Text("Total Price".tr,
                  style: titleStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(
                width: 5,
              ),
              Text(" ${formattingNumbers(listdata.ordersTotalprice!)}",
                  style: numberStyle.copyWith(
                      fontSize: 16,
                      color: secondColor,
                      fontWeight: FontWeight.bold)),
              const Spacer(),
              CircleAvatar(
                backgroundColor:
                    myServices.sharedPreferences.getBool('mode') == true
                        ? white
                        : primaryColor,
                child: IconButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.ordersdetails,
                        arguments: {"ordersmodel": listdata});
                  },
                  icon: const Icon(Icons.info_outline),
                  color: AppColor.secondColor,
                ),
              ),
              customSizedBox(5),
              if (listdata.ordersStatus! == 4)
                CircleAvatar(
                  backgroundColor:
                      myServices.sharedPreferences.getBool('mode') == true
                          ? white
                          : primaryColor,
                  child: IconButton(
                    onPressed: () {
                      controller.deleteOrder(listdata.ordersId!.toString());
                    },
                    color: Colors.red,
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
