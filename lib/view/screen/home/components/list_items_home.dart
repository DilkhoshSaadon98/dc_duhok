import 'package:cached_network_image/cached_network_image.dart';
import 'package:dc_duhok/controller/cart_controller.dart';
import 'package:dc_duhok/controller/home_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/functions/formating_numbers.dart';
import 'package:dc_duhok/core/functions/translatefatabase.dart';
import 'package:dc_duhok/core/shared/custom_snack_bar.dart';
import 'package:dc_duhok/core/shared/show_sold_out.dart';
import 'package:dc_duhok/data/model/items_model.dart';
import 'package:dc_duhok/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return SizedBox(
      height: 220.h,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return ItemsHome(
                itemsModel: ItemsModel.fromJson(controller.items[i]));
          }),
    );
  }
}

class ItemsHome extends StatelessWidget {
  final ItemsModel itemsModel;
  const ItemsHome({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return Stack(
        children: [
          GestureDetector(
            onTap: () {
              controller.goToPageProductDetails(itemsModel);
            },
            child: Container(
              width: Get.width * .44,
              height: 220,
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.only(bottom: 10, left: 10, top: 10),
              decoration: BoxDecoration(
                color: myServices.sharedPreferences.getBool('mode') == true
                    ? black
                    : white,
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: CachedNetworkImageProvider(
                        "${AppLink.imagestItems}${itemsModel.itemsImage}")),
                border: Border.all(
                    color: myServices.sharedPreferences.getBool('mode') == true
                        ? white
                        : primaryColor,
                    width: 1),
                borderRadius: BorderRadius.circular(constRadius),
                //gradient: customGradient()
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName, itemsModel.itemsNameKu)}",
                    style: bodyStyle.copyWith(fontSize: 18.sp),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: primaryColor,
                            radius: 15,
                            child: GetBuilder<CartController>(
                                builder: (cartController) {
                              return IconButton(
                                  onPressed: () {
                                    customSnackBar(
                                        'Success', 'The items added to cart');
                                    cartController.add(
                                        itemsModel.itemsId.toString(),
                                        itemsModel.itemsCount);
                                  },
                                  icon: const Icon(
                                    Icons.add_shopping_cart_sharp,
                                    color: secondColor,
                                    size: 15,
                                  ));
                            }),
                          ),
                          Text(
                            formattingNumbers(itemsModel.itemsPricedisount!),
                            style: bodyStyle.copyWith(fontSize: 18),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
          soldOut(itemsModel.itemsCount!.toInt())
        ],
      );
    });
  }
}
