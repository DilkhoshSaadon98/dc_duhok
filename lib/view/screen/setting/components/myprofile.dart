import 'package:dc_duhok/controller/settings_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/constant/imgaeasset.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:dc_duhok/core/shared/custom_divider.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/core/shared/custom_widget_gsture_back.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return Scaffold(
        appBar: customAppBarTitle('About Us'.tr, true),
        body: CustomWidgetBack(
            widget: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: constScreenPadding, vertical: 15),
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: white,
                          border: Border.all(width: .5, color: secondColor)),
                      child: Image.asset(
                        AppImageAsset.logo,
                        width: 75,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          appName,
                          style: titleStyle,
                        ),
                        customSizedBox(5),
                        Text(
                          'DCduhok.business@gmail.com',
                          style: bodyStyle,
                        ),
                      ],
                    )
                  ],
                ),
                customSizedBox(),
                GetBuilder<SettingsController>(builder: (controller) {
                  return SizedBox(
                    height: 50,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                              controller.aboutMeContactInfo.length,
                              (index) => GestureDetector(
                                    onTap: controller.onTapAboutMe[index],
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: .5, color: secondColor)),
                                      child: CircleAvatar(
                                        backgroundColor: darkCardColor,
                                        radius: 50,
                                        child: Icon(
                                          controller.aboutMeContactInfo[index]
                                              ['icon'],
                                          color: secondColor,
                                        ),
                                      ),
                                    ),
                                  ))
                        ],
                      ),
                    ),
                  );
                }),
                customSizedBox(),
                customDivider(),
                customSizedBox(),
                Text.rich(
                    textAlign: TextAlign.justify,
                    TextSpan(
                        style: bodyStyle,
                        text:
                            "DC DUHOK is a small business dedicated to serving electronics enthusiasts, students working on graduation projects, and individuals seeking quality electronic components, especially those related to Arduino and its ecosystem. Our mission is to provide a one-stop shop for electronics components, offer design and consulting services for graduation projects, and foster a vibrant community of makers and innovators, DC DUHOK represents both the concept of Direct Current (DC) electronics and the location of the business, Duhok,"
                                .tr,
                        children: <InlineSpan>[
                          TextSpan(
                            text: '\n\nProducts and Services:'.tr,
                            style: titleStyle.copyWith(color: secondColor),
                          ),
                          TextSpan(
                            text: '\n1- Electronic Components Retail: '.tr,
                            style: titleStyle.copyWith(fontSize: 14),
                          ),
                          TextSpan(
                            text:
                                'DC DUHOK offers a wide range of electronic components, including Arduino boards, sensors, actuators, LEDs, resistors, capacitors, and more. We source our products from reputable suppliers to ensure the highest quality for our customers.'
                                    .tr,
                            style: bodyStyle,
                          ),
                          TextSpan(
                            text: '\n\n2- Arduino Ecosystem: '.tr,
                            style: titleStyle.copyWith(fontSize: 14),
                          ),
                          TextSpan(
                            text:
                                " We specialize in Arduino-compatible components and accessories, making it easier for hobbyists and professionals to find everything they need to build innovative projects. Our inventory includes Arduino boards, shields, kits, and programming accessories."
                                    .tr,
                            style: bodyStyle,
                          ),
                          TextSpan(
                            text: '\n\n3- Design and Consulting Services: '.tr,
                            style: titleStyle.copyWith(fontSize: 14),
                          ),
                          TextSpan(
                            text:
                                "DC DUHOK provides design and consulting services for students and professionals working on graduation projects or other electronic ventures. Our experienced team offers guidance, technical support, and project development assistance to help customers bring their ideas to life."
                                    .tr,
                            style: bodyStyle,
                          ),
                          TextSpan(
                            text: '\n\n4- Workshops and Training: '.tr,
                            style: titleStyle.copyWith(fontSize: 14),
                          ),
                          TextSpan(
                            text:
                                " We host workshops and training sessions to educate customers about electronics and programming. These sessions are suitable for beginners and experienced makers alike, helping them develop their skills and build confidence in working with electronic components."
                                    .tr,
                            style: bodyStyle,
                          ),
                          TextSpan(
                            text: '\n\n5- Community Engagement:'.tr,
                            style: titleStyle.copyWith(fontSize: 14),
                          ),
                          TextSpan(
                            text:
                                "DC DUHOK aims to foster a strong community of electronics enthusiasts. We organize meetups, online forums, and events where like-minded individuals can share knowledge, collaborate on projects, and inspire each other."
                                    .tr,
                            style: bodyStyle,
                          ),
                          TextSpan(
                            text: "\n\nUnique Selling Points:".tr,
                            style: titleStyle.copyWith(color: secondColor),
                          ),
                          TextSpan(
                            text: '\n1- Quality Assurance: '.tr,
                            style: titleStyle.copyWith(fontSize: 14),
                          ),
                          TextSpan(
                            text:
                                "We prioritize quality and reliability in our products, ensuring that our customers have access to the best components for their projects."
                                    .tr,
                            style: bodyStyle,
                          ),
                          TextSpan(
                            text: '\n\n2-Expert Guidance:'.tr,
                            style: titleStyle.copyWith(fontSize: 14),
                          ),
                          TextSpan(
                            text:
                                " Our team of experts is always available to provide technical support, answer questions, and offer advice, making electronics accessible to everyone."
                                    .tr,
                            style: bodyStyle,
                          ),
                          TextSpan(
                            text: '\n\n3-Comprehensive Inventory: '.tr,
                            style: titleStyle.copyWith(fontSize: 14),
                          ),
                          TextSpan(
                            text:
                                "We maintain a comprehensive inventory of electronic components, reducing the need for customers to search elsewhere for their project needs."
                                    .tr,
                            style: bodyStyle,
                          ),
                          TextSpan(
                            text: '\n\n4-Educational Focus: '.tr,
                            style: titleStyle.copyWith(fontSize: 14),
                          ),
                          TextSpan(
                            text:
                                " We are committed to educating and empowering our customers through workshops, training, and community-building initiatives."
                                    .tr,
                            style: bodyStyle,
                          ),
                        ])),
              ],
            ),
          ),
        )));
  }
}
