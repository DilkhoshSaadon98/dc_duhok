import 'package:cached_network_image/cached_network_image.dart';
import 'package:dc_duhok/controller/myfavorite_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/functions/formating_numbers.dart';
import 'package:dc_duhok/core/functions/translatefatabase.dart';
import 'package:dc_duhok/core/shared/custom_card_style.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/data/model/myfavorite_model.dart';
import 'package:dc_duhok/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteController> {
  final MyFavoriteModel itemsModel;
  // final bool active;
  const CustomListFavoriteItems({Key? key, required this.itemsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: customCardStyle(
          myServices.sharedPreferences.getBool('mode') == true ? black : white,
          secondColor,
          primaryColor),
      child: InkWell(
          onTap: () {
            //  controller.goToPageProductDetails(itemsModel);
          },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    translateDatabase(itemsModel.itemsNameAr,
                        itemsModel.itemsName, itemsModel.itemsNameKu),
                    style: titleStyle),
                customSizedBox(10),
                Hero(
                  tag: "${itemsModel.itemsId}",
                  child: CachedNetworkImage(
                    imageUrl:
                        "${AppLink.imagestItems}/${itemsModel.itemsImage!}",
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formattingNumbers(itemsModel.itemPriceDiscount!),
                        style: numberStyle),
                    IconButton(
                        onPressed: () {
                          controller.deleteFromFavorite(
                              itemsModel.favoriteId!.toString());
                        },
                        icon: CircleAvatar(
                          radius: 15,
                          backgroundColor: primaryColor,
                          child: const Icon(
                            size: 15,
                            Icons.favorite,
                            color: secondColor,
                          ),
                        ))
                  ],
                )
              ])),
    );
  }
}






























// logical thinking

  // GetBuilder<FavoriteController>(
  //                         builder: (controller) => IconButton(
  //                             onPressed: () {
  //                                 if (controller.isFavorite[itemsModel.itemsId] == "1" ) {
  //                                   controller.setFavorite(
  //                                       itemsModel.itemsId, "0");
  //                                 } else {
  //                                   controller.setFavorite(
  //                                       itemsModel.itemsId, "1");
  //                                 }
  //                             },
  //                             icon: Icon(
  //                               controller.isFavorite[itemsModel.itemsId] == "1"
  //                                   ? Icons.favorite
  //                                   : Icons.favorite_border_outlined,
  //                               color: AppColor.primaryColor,
  //                             )))