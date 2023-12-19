import 'package:dc_duhok/controller/notification_controller.dart';
import 'package:dc_duhok/core/class/handlingdataview.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/functions/check_user_account.dart';
import 'package:dc_duhok/core/functions/translatefatabase.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/core/shared/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController(), permanent: true);
    return Scaffold(
        appBar: customAppBarTitle("Notifications".tr, false, true),
        body: checkUserAccount(
          GetBuilder<NotificationController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {
                                controller.data[index].notificationIsread == 0
                                    ? await controller.readNotification(
                                        controller.data[index].notificationId
                                            .toString())
                                    : null;
                                controller.goToDetails(
                                  translateDatabase(
                                    controller.data[index].notificationTitleAr,
                                    controller.data[index].notificationTitle,
                                    controller.data[index].notificationTitleKu,
                                  ),
                                  translateDatabase(
                                    controller.data[index].notificationBodyAr,
                                    controller.data[index].notificationBody,
                                    controller.data[index].notificationBodyKu,
                                  ),
                                  controller.data[index].notificationDatetime!,
                                );
                              },
                              child: ListTile(
                                contentPadding: const EdgeInsets.only(
                                    top: 5,
                                    // bottom: 10,
                                    left: 10,
                                    right: 10),
                                leading: Icon(
                                  controller.data[index].notificationIsread != 1
                                      ? Icons.notifications_active
                                      : Icons.notifications_outlined,
                                  color: controller
                                              .data[index].notificationIsread !=
                                          1
                                      ? secondColor
                                      : myServices.sharedPreferences
                                                  .getBool('mode') ==
                                              true
                                          ? white
                                          : primaryColor,
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                      translateDatabase(
                                        controller
                                            .data[index].notificationTitleAr,
                                        controller
                                            .data[index].notificationTitle,
                                        controller
                                            .data[index].notificationTitleKu,
                                      ),
                                      style: titleStyle),
                                ),
                                subtitle: SizedBox(
                                  height: 30,
                                  child: Text(
                                      translateDatabase(
                                        controller
                                            .data[index].notificationBodyAr,
                                        controller.data[index].notificationBody,
                                        controller
                                            .data[index].notificationBodyKu,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      style: bodyStyle),
                                ),
                                trailing: Text(
                                  Jiffy(controller
                                          .data[index].notificationDatetime)
                                      .fromNow(),
                                  style: bodyStyle.copyWith(color: secondColor),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => customDivider(),
                          itemCount: controller.data.length)))),
        ));
  }
}
