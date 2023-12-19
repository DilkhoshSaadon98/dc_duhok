import 'package:dc_duhok/controller/productdetails_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_widget/zoom_widget.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    return GetBuilder<ProductDetailsControllerImp>(builder: (controller) {
      return SizedBox(
          height: controller.dataImage.isEmpty ? 300 : 400,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Hero(
                    tag: "${controller.itemsModel.itemsId}",
                    child: Zoom(
                      backgroundColor:
                          myServices.sharedPreferences.getBool('mode') == true
                              ? black
                              : white,
                      colorScrollBars: secondColor,
                      doubleTapAnimDuration: const Duration(milliseconds: 700),
                      doubleTapZoom: true,
                      enableScroll: true,
                      canvasColor:
                          myServices.sharedPreferences.getBool('mode') == true
                              ? black
                              : white,
                      initTotalZoomOut: true,
                      child: Image.network(
                        controller.dataImage.isEmpty
                            ? "${AppLink.imagestItems}${controller.itemsModel.itemsImage}"
                            : "${AppLink.imagestItems}${controller.imageRoot}",
                        height: 300,
                        width: 301,
                        fit: BoxFit.contain,
                      ),
                    )),
              ),
              controller.dataImage.isEmpty ? Container() : customSizedBox(25),
              controller.dataImage.isEmpty
                  ? Container()
                  : Expanded(
                      flex: 1,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.dataImage.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                controller.changeImge(controller
                                    .dataImage[index]['items_images_name']);
                              },
                              child: Container(
                                width: 75,
                                height: 75,
                                padding: const EdgeInsets.all(5),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: myServices.sharedPreferences
                                                .getBool('mode') ==
                                            true
                                        ? darkCardColor
                                        : white,
                                    border: Border.all(
                                        width: controller.imageRoot !=
                                                controller.dataImage[index]
                                                    ['items_images_name']
                                            ? 1
                                            : 2,
                                        color: controller.imageRoot !=
                                                controller.dataImage[index]
                                                    ['items_images_name']
                                            ? primaryColor
                                            : secondColor),
                                    borderRadius:
                                        BorderRadius.circular(constRadius)),
                                child: Image.network(
                                    "${AppLink.imagestItems}${controller.dataImage[index]['items_images_name']}"),
                              ),
                            );
                          }),
                    )
            ],
          ));
    });
  }
}
