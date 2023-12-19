import 'package:dc_duhok/controller/favorite_controller.dart';
import 'package:dc_duhok/controller/productdetails_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/functions/translatefatabase.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/core/shared/custom_snack_bar.dart';
import 'package:dc_duhok/core/shared/custom_widget_gsture_back.dart';
import 'package:dc_duhok/view/screen/product_details/components/price_and_count.dart';
import 'package:dc_duhok/view/screen/product_details/components/top_page_product_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:get/get.dart';

class ProductDetails extends GetView<ProductDetailsControllerImp> {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    void _shareProduct(String productName, String productDescription) {
      String message =
          'Check out this product: \n$productName\nOnly: $productDescription IQ'
          '\nDownload our app: \nhttps://dc-duhok.ar.uptodown.com/android';

      // Use the share package to share the message via WhatsApp
      Share.share(message, subject: 'Product Details');
    }

    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    Get.put(FavoriteController());

    return Scaffold(
        appBar: customAppBarTitle(
            translateDatabase(
                controller.itemsModel.itemsNameAr!,
                controller.itemsModel.itemsName!,
                controller.itemsModel.itemsNameKu),
            true,
            true),
        body: CustomWidgetBack(
          widget: GetBuilder<ProductDetailsControllerImp>(
              builder: (controller) => ListView(children: [
                    //! Product Header
                    const TopProductPageDetails(),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "${translateDatabase(controller.itemsModel.itemsNameAr!, controller.itemsModel.itemsName!, controller.itemsModel.itemsNameKu)}",
                                    style: titleStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                    onTap: () {
                                      _shareProduct(
                                          controller.itemsModel.itemsName!,
                                          controller
                                              .itemsModel.itemsPricedisount!
                                              .toString());
                                    },
                                    child: const Icon(
                                      FontAwesomeIcons.shareFromSquare,
                                      color: Colors.teal,
                                      size: 20,
                                    )),
                                const Spacer(),
                                CircleAvatar(
                                  backgroundColor: primaryColor,
                                  radius: 15,
                                  child: GetBuilder<FavoriteController>(
                                      builder: (favController) => IconButton(
                                          onPressed: () {
                                            if (favController.isFavorite[
                                                        controller.itemsModel
                                                            .itemsId] ==
                                                    '1' ||
                                                controller
                                                        .itemsModel.favorite ==
                                                    1) {
                                              favController.setFavorite(
                                                  controller.itemsModel.itemsId,
                                                  "0");
                                              favController.removeFavorite(
                                                  controller.itemsModel.itemsId!
                                                      .toString());
                                            } else {
                                              favController.setFavorite(
                                                  controller.itemsModel.itemsId,
                                                  "1");
                                              favController.addFavorite(
                                                  controller.itemsModel.itemsId!
                                                      .toString());
                                            }
                                          },
                                          iconSize: 15,
                                          icon: Icon(
                                            favController.isFavorite[controller
                                                            .itemsModel
                                                            .itemsId] ==
                                                        '1' ||
                                                    controller.itemsModel
                                                            .favorite ==
                                                        1
                                                ? Icons.favorite
                                                : Icons
                                                    .favorite_border_outlined,
                                            color: secondColor,
                                          ))),
                                )
                              ],
                            ),
                            customSizedBox(10),
                            //! Price And Count Items :
                            PriceAndCountItems(
                                onAdd: () {
                                  controller.add();
                                },
                                onRemove: () {
                                  controller.remove();
                                },
                                price:
                                    controller.itemsModel.itemsPricedisount == 0
                                        ? controller.itemsModel.itemsPrice!
                                        : controller
                                            .itemsModel.itemsPricedisount!,
                                count: controller.countitems),
                            customSizedBox(
                              5,
                            ),
                            Divider(
                              thickness: 1,
                              color: primaryColor,
                            ),
                            customSizedBox(10),
                            Text(
                              "Description:".tr,
                              style: titleStyle.copyWith(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                                "${translateDatabase(controller.itemsModel.itemsDescAr!, controller.itemsModel.itemsDesc!, controller.itemsModel.itemsDescKu!)}",
                                textAlign: TextAlign.justify,
                                style: bodyStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                )),
                          ]),
                    )
                  ])),
        ));
  }
}
