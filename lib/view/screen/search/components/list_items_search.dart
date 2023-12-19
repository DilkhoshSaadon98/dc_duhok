import 'package:dc_duhok/controller/cart_controller.dart';
import 'package:dc_duhok/controller/favorite_controller.dart';
import 'package:dc_duhok/controller/home_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/constant/imgaeasset.dart';
import 'package:dc_duhok/core/functions/formating_numbers.dart';
import 'package:dc_duhok/core/functions/translatefatabase.dart';
import 'package:dc_duhok/core/shared/custom_snack_bar.dart';
import 'package:dc_duhok/core/shared/show_sold_out.dart';
import 'package:dc_duhok/data/model/items_model.dart';
import 'package:dc_duhok/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({
    super.key,
    required this.listdatamodel,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    Get.put(FavoriteController());
    HomeControllerImp controllerHome = Get.put(HomeControllerImp());
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: .75,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          bool isDiscount =
              listdatamodel[index].itemsDiscount == 0 ? true : false;
          return InkWell(
            onTap: () {
              controllerHome.goToPageProductDetails(listdatamodel[index]);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: primaryColor,
                          child: GetBuilder<FavoriteController>(
                              builder: (favController) => CircleAvatar(
                                    backgroundColor: primaryColor,
                                    radius: 15,
                                    child: IconButton(
                                        onPressed: () {
                                          if (favController.isFavorite[
                                                      listdatamodel[index]
                                                          .itemsId] ==
                                                  '1' ||
                                              listdatamodel[index].favorite ==
                                                  1) {
                                            favController.setFavorite(
                                                listdatamodel[index].itemsId,
                                                "0");
                                            favController.removeFavorite(
                                                listdatamodel[index]
                                                    .itemsId!
                                                    .toString());
                                          } else {
                                            favController.setFavorite(
                                                listdatamodel[index].itemsId,
                                                "1");
                                            favController.addFavorite(
                                                listdatamodel[index]
                                                    .itemsId!
                                                    .toString());
                                          }
                                        },
                                        iconSize: 15,
                                        icon: Icon(
                                          favController.isFavorite[
                                                          listdatamodel[index]
                                                              .itemsId] ==
                                                      '1' ||
                                                  listdatamodel[index]
                                                          .favorite ==
                                                      1
                                              ? Icons.favorite
                                              : Icons.favorite_border_outlined,
                                          color: secondColor,
                                        )),
                                  )),
                        ),
                        listdatamodel[index].itemsDiscount != 0
                            ? Stack(
                                children: [
                                  Image.asset(height: 30, AppImageAsset.saleOne)
                                ],
                              )
                            : Container()
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Image.network(
                            height: 75,
                            "${AppLink.imagestItems}${listdatamodel[index].itemsImage}"),
                        Text(
                          translateDatabase(
                              listdatamodel[index].itemsNameAr,
                              listdatamodel[index].itemsName,
                              listdatamodel[index].itemsNameKu),
                          style: titleStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GetBuilder<CartController>(builder: (controller) {
                              return CircleAvatar(
                                backgroundColor: secondColor,
                                radius: 15,
                                child: IconButton(
                                    onPressed: () {
                                      customSnackBar(
                                  'Success', 'The items added to cart');
                                      controller.add(
                                          listdatamodel[index]
                                              .itemsId
                                              .toString(),
                                          listdatamodel[index].itemsCount);
                                    },
                                    icon: Icon(
                                      size: 15,
                                      Icons.shopping_cart_outlined,
                                      color: primaryColor,
                                    )),
                              );
                            }),
                            listdatamodel[index].itemsDiscount == 0
                                ? Text(
                                    formattingNumbers(
                                        listdatamodel[index].itemsPrice!),
                                    style: numberStyle.copyWith(
                                      fontSize: 14,
                                    ))
                                : Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Text(
                                          formattingNumbers(listdatamodel[index]
                                              .itemsPricedisount!),
                                          style: bodyStyle.copyWith()),
                                      Positioned(
                                        bottom: -15,
                                        child: Text(
                                            formattingNumbers(
                                                listdatamodel[index]
                                                    .itemsPrice!),
                                            style: bodyStyle.copyWith(
                                                color: isDiscount != true
                                                    ? Colors.red
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
                        )
                      ],
                    ),
                    soldOut(
                      listdatamodel[index].itemsCount!.toInt(),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
