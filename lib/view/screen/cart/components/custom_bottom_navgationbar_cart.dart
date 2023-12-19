import 'package:dc_duhok/controller/cart_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/functions/formating_numbers.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/view/screen/cart/components/buttoncart.dart';
import 'package:dc_duhok/view/screen/cart/components/custom_button_coupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavgationBarCart extends GetView<CartController> {
  final String price;
  final String discount;
  final int shipping;
  final String totalprice;
  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;
  const BottomNavgationBarCart(
      {Key? key,
      required this.price,
      required this.discount,
      required this.shipping,
      required this.totalprice,
      required this.controllercoupon,
      this.onApplyCoupon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GetBuilder<CartController>(
            builder: (controller) => controller.couponname == null
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(children: [
                      Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: controllercoupon,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              hintText: "Coupon code".tr,
                              hintStyle: bodyStyle,
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.secondColor, width: .5),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.thirdColor, width: .5),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: secondColor, width: .5),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: myServices.sharedPreferences
                                                  .getBool('mode') ==
                                              true
                                          ? white
                                          : primaryColor,
                                      width: 1.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5))),
                            ),
                          )),
                      const SizedBox(width: 5),
                      Expanded(
                          flex: 1,
                          child: CustomButtonCoupon(
                            textbutton: "Apply".tr,
                            onPressed: onApplyCoupon,
                          ))
                    ]))
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Coupon Code:".tr,
                          style: titleStyle.copyWith(
                              color: primaryColor, fontSize: 20),
                        ),
                        Text(
                          "'${controller.couponname!.toUpperCase()}'",
                          style: titleStyle.copyWith(
                              color: primaryColor, fontSize: 20),
                        ),
                      ],
                    ),
                  )),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(
                  color: myServices.sharedPreferences.getBool('mode') == true
                      ? white
                      : primaryColor,
                  width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Price".tr,
                        style: bodyStyle.copyWith(fontSize: 16))),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(formattingNumbers(int.parse(price)),
                        style:
                            numberStyle.copyWith(fontWeight: FontWeight.w300)))
              ],
            ),
            customSizedBox(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Coupon Discount".tr,
                        style: bodyStyle.copyWith(fontSize: 16))),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$discount %",
                        style:
                            numberStyle.copyWith(fontWeight: FontWeight.w300)))
              ],
            ),
            customSizedBox(5),
            Divider(
              thickness: 1,
              color: myServices.sharedPreferences.getBool('mode') == true
                  ? white
                  : primaryColor,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Total Price".tr,
                        style: bodyStyle.copyWith(fontSize: 16))),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(totalprice + ' IQ'.tr,
                        style:
                            numberStyle.copyWith(fontWeight: FontWeight.w300)))
              ],
            ),
          ]),
        ),
        const SizedBox(height: 10),
        CustomButtonCart(
          price: totalprice,
          textbutton: "Check Out".tr,
          onPressed: () {
            controller.goToPageCheckout();
          },
        )
      ],
    );
  }
}
