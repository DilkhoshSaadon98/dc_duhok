import 'package:dc_duhok/controller/messenger_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/view/screen/messenger/components/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MessengerController());
    return Scaffold(
      appBar: customAppBarTitle(
        'Messages',
        false,
        true,
      ),
      body: GetBuilder<MessengerController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: ListView.separated(
            itemCount: 1,
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 2,
              );
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(const ChatScreen());
                },
                child: Container(
                  width: Get.width,
                  height: 80,
                  padding: EdgeInsets.symmetric(
                      horizontal: constScreenPadding, vertical: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: primaryColor,
                        child: const Icon(
                          Icons.person,
                          color: secondColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.reciverName,
                            style: titleStyle,
                          ),
                          Row(
                            children: [
                              Icon(
                                controller.isMessageRead != true
                                    ? Icons.check
                                    : FontAwesomeIcons.checkDouble,
                                size: 10,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                controller.lastMessageText,
                                style: bodyStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      controller.unReadMessage == 0
                          ? Container()
                          : CircleAvatar(
                              radius: 10,
                              backgroundColor: secondColor,
                              child: Text(
                                controller.unReadMessage.toString(),
                                style: numberStyle.copyWith(fontSize: 10),
                              ),
                            )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
