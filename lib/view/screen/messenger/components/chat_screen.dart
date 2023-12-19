import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dc_duhok/controller/messenger_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/view/screen/messenger/components/bottom_bar.dart';
import 'package:dc_duhok/view/screen/messenger/components/message_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MessengerController mainController = Get.put(MessengerController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mainController.reciverName,
          style: titleStyle.copyWith(color: secondColor),
        ),
      ),
      body: GetBuilder<MessengerController>(builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: controller.firestore
                    .collection('messages')
                    .orderBy('timestamp', descending: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  List<MessageLine> messageWidget = [];
                  if (!snapshot.hasData) {
                    const Center(child: Text('loading....'));
                  } else {
                    final messages = snapshot.data!.docs.reversed;
                    for (var message in messages) {
                      final messageContent = message.get('text');
                      final messageSender = message.get('sender');
                      final messageIsRead = message.get('read');
                      final messageTime = message.get('timestamp').toDate();
                      messageWidget.add(MessageLine(
                        text: messageContent,
                        sender: messageSender,
                        time: messageTime,
                        isRead: messageIsRead,
                        isMe:
                            myServices.sharedPreferences.getString('email')! ==
                                    messageSender
                                ? true
                                : false,
                      ));
                    }
                  }
                  return Expanded(
                    child: ListView(
                      reverse: true,
                      children: messageWidget,
                    ),
                  );
                }),
            const MessageBottomBar(),
          ],
        );
      }),
    );
  }
}
