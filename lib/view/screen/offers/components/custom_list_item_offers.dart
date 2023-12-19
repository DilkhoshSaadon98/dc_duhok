import 'package:dc_duhok/controller/favorite_controller.dart';
import 'package:dc_duhok/controller/offers_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/constant/imgaeasset.dart';
import 'package:dc_duhok/core/functions/formating_numbers.dart';
import 'package:dc_duhok/core/functions/translatefatabase.dart';
import 'package:dc_duhok/core/shared/custom_card_style.dart';
import 'package:dc_duhok/core/shared/show_sold_out.dart';
import 'package:dc_duhok/data/model/items_model.dart';
import 'package:dc_duhok/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItemsOffers extends GetView<OffersController> {
  final ItemsModel itemsModel;
  final int itemIndex;
  // final bool active;
  const CustomListItemsOffers(
      {super.key, required this.itemsModel, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
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
              padding: const EdgeInsets.only(bottom: 20, left: 10, top: 10),
              decoration: BoxDecoration(
                color: cartColor,
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(
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
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Text(
                          "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName, itemsModel.catagoriesNameKu)}",
                          style: titleStyle),
                      //           itemsModel.itemsDiscount != 0
                      itemsModel.itemsDiscount != 0
                          ? Positioned(
                              top: -4,
                              right: 70,
                              child: CircleAvatar(
                                backgroundColor: Colors.redAccent,
                                radius: 15,
                                child: Text(
                                    '${itemsModel.itemsDiscount.toString()}%',
                                    style: numberStyle.copyWith(
                                        color: white, fontSize: 10)),
                              ))
                          : Container()
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: primaryColor,
                            radius: 15,
                            child: GetBuilder<FavoriteController>(
                                builder: (favController) {
                              return IconButton(
                                  onPressed: () {
                                    if (favController
                                            .isFavorite[itemsModel.itemsId] ==
                                        '1') {
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
                                  icon: Icon(
                                    favController.isFavorite[
                                                itemsModel.itemsId] !=
                                            '1'
                                        ? Icons.favorite_border_sharp
                                        : Icons.favorite_sharp,
                                    color: secondColor,
                                    size: 15,
                                  ));
                            }),
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Text(
                                  formattingNumbers(
                                      itemsModel.itemsPricedisount!),
                                  style: numberStyle.copyWith(
                                      color: myServices.sharedPreferences
                                                  .getBool('mode') ==
                                              true
                                          ? white
                                          : primaryColor)),
                              itemsModel.itemsDiscount != 0
                                  ? Positioned(
                                      bottom: -15,
                                      child: Text(
                                          formattingNumbers(
                                              itemsModel.itemsPrice!),
                                          style: numberStyle.copyWith(
                                              fontWeight: FontWeight.w100,
                                              color: itemsModel.itemsDiscount !=
                                                      0
                                                  ? Colors.red
                                                  : myServices.sharedPreferences
                                                              .getBool(
                                                                  'mode') !=
                                                          true
                                                      ? white
                                                      : primaryColor,
                                              decoration:
                                                  itemsModel.itemsDiscount != 0
                                                      ? TextDecoration
                                                          .lineThrough
                                                      : TextDecoration.none)),
                                    )
                                  : Container(),
                            ],
                          ),
                        ]),
                  )
                ],
              )),
        ),
        soldOut(itemsModel.itemsCount!.toInt())
      ],
    );
  }
}
