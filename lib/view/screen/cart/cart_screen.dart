// ignore_for_file: prefer_const_constructors
import 'package:dc_duhok/controller/cart_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/functions/check_user_account.dart';
import 'package:dc_duhok/core/functions/translatefatabase.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/core/shared/custom_snack_bar.dart';
import 'package:dc_duhok/view/screen/cart/components/custom_bottom_navgationbar_cart.dart';
import 'package:dc_duhok/view/screen/cart/components/custom_items_cart_list.dart';
import 'package:dc_duhok/view/screen/cart/components/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
        appBar: customAppBarTitle('My Cart'.tr, true),
        bottomNavigationBar:
            myServices.systemSharedPreferences.getString('step') == '1'
                ? Container(
                    height: 10,
                  )
                : GetBuilder<CartController>(
                    builder: (controller) => BottomNavgationBarCart(
                        shipping: 5000,
                        controllercoupon: controller.controllerCoupon!,
                        onApplyCoupon: () {
                          controller.checkcoupon();
                        },
                        price: "${controller.priceorders}",
                        discount: "${controller.discountcoupon}",
                        totalprice: "${controller.getTotalPrice()}")),
        body: checkUserAccount(GetBuilder<CartController>(
            builder: ((controller) =>ListView(
                    children: [
                      SizedBox(height: 10),
                      TopCardCart(
                          itemsnum: controller.totalcountitems.toString(),
                          messageTow: ' Items in Your Cart'.tr,
                          messageOne: "You Have ".tr),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ...List.generate(
                              controller.data.length,
                              (index) => CustomItemsCartList(
                                  onAdd: () async {
                                    controller.data[index].countitems! <
                                            controller.data[index].itemsCount!
                                        ? await controller.add(controller
                                            .data[index].itemsId!
                                            .toString())
                                        : customSnackBar('Warning',
                                            'Items count not enough');
                                    controller.refreshPage();
                                  },
                                  onRemove: () async {
                                    await controller.delete(controller
                                        .data[index].itemsId!
                                        .toString());
                                    controller.refreshPage();
                                  },
                                  imagename:
                                      "${controller.data[index].itemsImage}",
                                  name:
                                      "${translateDatabase(controller.data[index].itemsNameAr!, controller.data[index].itemsName!, controller.data[index].itemsNameKu!)}",
                                  price: "${controller.data[index].itemsprice}",
                                  count:
                                      "${controller.data[index].countitems}"),
                            )
                          ],
                        ),
                      )
                    ],
                  )))));
  }
}
