import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class MessageLine extends StatelessWidget {
  final String? text;
  final String? sender;
  final DateTime? time;
  final bool? isMe;
  final bool? isRead;
  const MessageLine(
      {super.key, this.text, this.sender, this.isMe, this.time, this.isRead});

  @override
  Widget build(BuildContext context) {
    Jiffy jiffy = Jiffy(time, "yyyy-MM-dd HH:mm:ss");
    return Container(
      width: Get.width,
      padding:
          EdgeInsets.symmetric(horizontal: constScreenPadding, vertical: 10),
      child: Column(
        crossAxisAlignment:
            isMe == true ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                color: isMe == true ? primaryColor : secondColor,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10))),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                isMe != true
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Icon(
                          isRead == true
                              ? FontAwesomeIcons.checkDouble
                              : Icons.check,
                          size: 10,
                          color: isRead == true ? secondColor : grey,
                        ),
                      ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '$text',
                  style: bodyStyle.copyWith(
                      color: isMe != true ? primaryColor : secondColor),
                ),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    jiffy.format("hh:mm a"),
                    style: bodyStyle.copyWith(color: grey, fontSize: 10),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
