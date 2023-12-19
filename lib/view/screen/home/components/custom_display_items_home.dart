import 'package:dc_duhok/controller/cart_controller.dart';
import 'package:dc_duhok/controller/favorite_controller.dart';
import 'package:dc_duhok/controller/items/show_items.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/functions/formating_numbers.dart';
import 'package:dc_duhok/core/functions/translatefatabase.dart';
import 'package:dc_duhok/core/shared/show_sold_out.dart';
import 'package:dc_duhok/data/model/items_model.dart';
import 'package:dc_duhok/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItemsHome extends GetView<ShowItemsControllerImp> {
  final ItemsModel itemsModel;
  // final bool active;
  const CustomListItemsHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    bool isDiscount = itemsModel.itemsDiscount == 0 ? true : false;
    Get.put(CartController());
    Get.put(FavoriteController());
    Get.put(ShowItemsControllerImp());
    return Stack(
      children: [
        InkWell(
          onTap: () {
            controller.goToPageProductDetails(itemsModel);
          },
          child: Card(
            semanticContainer: true,
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Row(
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
                          ? Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: CircleAvatar(
                                  backgroundColor: Colors.redAccent,
                                  radius: 15,
                                  child: Text('${itemsModel.itemsDiscount} %',
                                      style: numberStyle.copyWith(
                                          fontSize: 10, color: white))),
                            )
                          : Container()
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Image.network(
                          height: 100,
                          "${AppLink.imagestItems}${itemsModel.itemsImage}"),
                      Flexible(
                        child: Text(
                          translateDatabase(itemsModel.itemsNameAr,
                              itemsModel.itemsName, itemsModel.itemsNameKu),
                          style: titleStyle,
                        ),
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GetBuilder<CartController>(builder: (controller) {
                              return CircleAvatar(
                                backgroundColor: secondColor,
                                radius: 15,
                                child: IconButton(
                                    onPressed: () {
                                      controller
                                          .add(itemsModel.itemsId.toString() , itemsModel.itemsCount);
                                    },
                                    icon: Icon(
                                      size: 15,
                                      Icons.shopping_cart_outlined,
                                      color: primaryColor,
                                    )),
                              );
                            }),
                            itemsModel.itemsDiscount == 0
                                ? Text(
                                    formattingNumbers(itemsModel.itemsPrice!),
                                    style: numberStyle.copyWith(
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
                                            formattingNumbers(
                                                itemsModel.itemsPrice!),
                                            style: bodyStyle.copyWith(
                                                color: isDiscount != true
                                                    ? secondColor
                                                    : myServices.sharedPreferences
                                                                .getBool(
                                                                    'mode') ==
                                                            true
                                                        ? white
                                                        : primaryColor,
                                                decoration: TextDecoration
                                                    .lineThrough)),
                                      )
                                    ],
                                  )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        soldOut(itemsModel.itemsCount!.toInt())
      ],
    );
  }
}
