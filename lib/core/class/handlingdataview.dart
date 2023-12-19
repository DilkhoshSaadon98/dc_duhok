import 'package:dc_duhok/core/class/statusrequest.dart';
import 'package:dc_duhok/core/constant/imgaeasset.dart';
import 'package:dc_duhok/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Container(
            height: Get.height,
            alignment: Alignment.center,
            child: Lottie.asset(AppImageAsset.loading, width: 300, height: 300))
        : statusRequest == StatusRequest.offlinefailure
            ? SizedBox(
                height: Get.height,
                child: Center(
                    child: Lottie.asset(AppImageAsset.noConnection,
                        width: 300, height: 300)),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Container(
                    height: Get.height,
                    alignment: Alignment.center,
                    child: Center(
                        child: Lottie.asset(AppImageAsset.serverFail,
                            width: 300, height: 300)),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(
                          AppImageAsset.noData,
                          width: 300,
                          height: 300,
                        ),
                      )
                    : statusRequest == StatusRequest.none
                        ? Center(
                            child: Lottie.asset(
                              AppImageAsset.noData,
                              width: 300,
                              height: 300,
                            ),
                          )
                        : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Container(
            height: Get.height,
            alignment: Alignment.center,
            child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.offlinefailure
            ? SizedBox(
                height: Get.height,
                child: Center(
                    child: Image.asset(AppImageAsset.noConnection,
                        width: 250, height: 250)),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Container(
                    height: Get.height,
                    alignment: Alignment.center,
                    child: Center(
                        child: Image.asset(AppImageAsset.serverFail,
                            width: 250, height: 250)),
                  )
                : statusRequest == StatusRequest.failure
                    ? Container(
                        height: Get.height,
                        alignment: Alignment.center,
                        child: Center(
                          child: Image.network(
                            "${AppLink.imagesConstant}no_data.gif",
                            width: 250,
                            height: 250,
                          ),
                        ),
                      )
                    : widget;
  }
}
