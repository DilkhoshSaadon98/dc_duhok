import 'package:dc_duhok/controller/messenger_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageBottomBar extends StatelessWidget {
  const MessageBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    MessengerController controller = Get.put(MessengerController());
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).cardColor),
      child: IconTheme(
        data: IconThemeData(color: primaryColor),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: controller.messageController,
                  onSubmitted: (text) {
                    controller.sendMessage(controller.messageController.text,
                        'dark4.knight9198@gmail.com');
                    controller.messageController.clear();
                  },
                  decoration: InputDecoration.collapsed(
                      hintText: 'Type a message...'.tr, hintStyle: bodyStyle),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  controller.sendMessage(controller.messageController.text,
                      'dark4.knight9198@gmail.com');
                  controller.messageController.clear();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
