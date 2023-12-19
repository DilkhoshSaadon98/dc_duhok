import 'package:cached_network_image/cached_network_image.dart';
import 'package:dc_duhok/controller/cart_controller.dart';
import 'package:dc_duhok/controller/favorite_controller.dart';
import 'package:dc_duhok/controller/items/items_controller.dart';
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

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  // final bool active;
  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    bool isDiscount = itemsModel.itemsDiscount == 0 ? true : false;
    Get.put(CartController());
    Get.put(FavoriteController());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: primaryColor),
          borderRadius: BorderRadius.circular(constRadius)),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              controller.goToPageProductDetails(itemsModel);
            },
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    padding:
                        EdgeInsets.only(bottom: 10.h, left: 10.w, top: 10.h),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              "${AppLink.imagestItems}${itemsModel.itemsImage}")),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GetBuilder<FavoriteController>(
                            builder: (favController) => CircleAvatar(
                                  backgroundColor: primaryColor,
                                  radius: 15,
                                  child: IconButton(
                                      onPressed: () {
                                        if (favController.isFavorite[
                                                    itemsModel.itemsId] ==
                                                '1' ||
                                            itemsModel.favorite == 1) {
                                          favController.setFavorite(
                                              itemsModel.itemsId, "0");
                                          favController.removeFavorite(
                                              itemsModel.itemsId!.toString());
                                        } else {
                                          favController.setFavorite(
                                              itemsModel.itemsId, "1");
                                          favController.addFavorite(
                                              itemsModel.itemsId!.toString());
                                        }
                                      },
                                      iconSize: 15,
                                      icon: Icon(
                                        favController.isFavorite[
                                                        itemsModel.itemsId] ==
                                                    '1' ||
                                                itemsModel.favorite == 1
                                            ? Icons.favorite
                                            : Icons.favorite_border_outlined,
                                        color: secondColor,
                                      )),
                                )),
                        itemsModel.itemsDiscount != 0
                            ? CircleAvatar(
                                backgroundColor: Colors.redAccent,
                                radius: 15,
                                child: Text('${itemsModel.itemsDiscount} %',
                                    style: numberStyle.copyWith(
                                        fontSize: 10, color: white)))
                            : Container()
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: Text(
                      translateDatabase(itemsModel.itemsNameAr,
                          itemsModel.itemsName, itemsModel.itemsNameKu),
                      overflow: TextOverflow.ellipsis,
                      style: titleStyle,
                    ),
                    subtitle: itemsModel.itemsDiscount == 0
                        ? Text(formattingNumbers(itemsModel.itemsPrice!),
                            overflow: TextOverflow.ellipsis,
                            style: bodyStyle.copyWith(
                              fontSize: 14,
                            ))
                        : Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Text(
                                  formattingNumbers(
                                      itemsModel.itemsPricedisount!),
                                  style: bodyStyle.copyWith()),
                              Positioned(
                                bottom: -15,
                                child: Text(
                                    formattingNumbers(itemsModel.itemsPrice!),
                                    style: bodyStyle.copyWith(
                                        color: isDiscount != true
                                            ? secondColor
                                            : myServices.sharedPreferences
                                                        .getBool('mode') ==
                                                    true
                                                ? white
                                                : primaryColor,
                                        decoration:
                                            TextDecoration.lineThrough)),
                              )
                            ],
                          ),
                    trailing: GetBuilder<CartController>(builder: (controller) {
                      return CircleAvatar(
                        backgroundColor: secondColor,
                        radius: 15,
                        child: IconButton(
                            onPressed: () {
                              customSnackBar(
                                  'Success', 'The items added to cart');
                              controller.add(itemsModel.itemsId.toString(),
                                  itemsModel.itemsCount);
                            },
                            icon: Icon(
                              size: 15,
                              Icons.shopping_cart_outlined,
                              color: primaryColor,
                            )),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
          soldOut(itemsModel.itemsCount!.toInt())
        ],
      ),
    );
  }
}
