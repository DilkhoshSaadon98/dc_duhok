import 'package:dc_duhok/controller/notification_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/core/shared/custom_divider.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationDetailsScreen extends StatelessWidget {
  const NotificationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationDetailsController());
    return Scaffold(
      appBar: customAppBarTitle('Notification Details', true),
      body: GetBuilder<NotificationDetailsController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                    backgroundColor:
                        myServices.sharedPreferences.getBool('mode') == true
                            ? white
                            : primaryColor,
                    child: Icon(
                      FontAwesomeIcons.d,
                      color:
                          myServices.sharedPreferences.getBool('mode') != true
                              ? secondColor
                              : black,
                    )),
                title: Text(appName, style: titleStyle),
                subtitle: Text(
                    'To ${myServices.sharedPreferences.getString('firstname')}',
                    style: bodyStyle),
                trailing: Text(
                  Jiffy(controller.time, "yyyy-MM-dd")
                      .yMd
                      .toString()
                      .capitalize!,
                  style: numberStyle.copyWith(fontWeight: FontWeight.w200),
                ),
              ),
              customDivider(),
              customSizedBox(),
              Text(
                controller.title!,
                style: titleStyle.copyWith(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),
              customSizedBox(),
              Text(controller.content!,
                  textAlign: TextAlign.justify, style: bodyStyle),
            ],
          ),
        );
      }),
    );
  }
}
