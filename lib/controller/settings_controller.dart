import 'package:dc_duhok/core/constant/routes.dart';
import 'package:dc_duhok/core/services/services.dart';
import 'package:dc_duhok/core/theme/theme_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  bool? isDarkMode;
  List<String> tileTitle = [
    'Account',
    'Offers',
    'Favorite',
    'Orders',
    'Archive',
    'Address',
    'App Language',
    // 'Delivery Price',
    'About Us',
    'Contact Me',
    'Log Out'
  ];
  List<IconData> tileIconData = [
    Icons.person,
    Icons.discount_outlined,
    Icons.favorite_border_outlined,
    Icons.card_giftcard,
    Icons.archive_outlined,
    Icons.location_on_outlined,
    Icons.mode,
    // Icons.price_change,
    Icons.help_outline_rounded,
    Icons.phone_callback_outlined,
    Icons.logout_outlined
  ];

  void toggleDarkMode(bool value) {
    // isDarkMode = value;
    // myServices.sharedPreferences.setBool('mode', value);
    // ThemeServices().switchTheme();
    // update();
  }

  logout() async {
    String userid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
    myServices.sharedPreferences.remove('id');
    myServices.sharedPreferences.remove('username');
    myServices.sharedPreferences.remove('email');
    myServices.sharedPreferences.remove('phone');
    myServices.sharedPreferences.remove('firstname');
    myServices.sharedPreferences.remove('lastname');
    myServices.sharedPreferences.setString("step", "1");
    //  myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.homepage);
  }

  changeMode() async {
    ThemeServices().switchTheme();
    await Get.offAndToNamed(AppRoute.homepage);
    update();
  }

  contactUs() async {
    await launchUrl(Uri.parse('tel: 009647510407010'));
  }

  List<Function()> onTap = [
    () {
      Get.toNamed(AppRoute.showAccount);
    },
    () {
      Get.toNamed(AppRoute.offersPage);
    },
    () {
      Get.toNamed(AppRoute.myfavroite);
    },
    () {
      Get.toNamed(AppRoute.orderspending);
    },
    () {
      Get.toNamed(AppRoute.ordersarchive);
    },
    () {
      Get.toNamed(AppRoute.addressview);
    },
    () {
      Get.toNamed(AppRoute.language);
    },
    // () {
    //   Get.toNamed(AppRoute.deliveryPrice);
    // },
    () {
      Get.toNamed(AppRoute.myProfile);
    },
    () async {
      await launchUrl(Uri.parse('tel: 009647510407010'));
    },
    () async {
      MyServices myServices = Get.find();
      String userid = myServices.sharedPreferences.getString("id")!;
      FirebaseMessaging.instance.unsubscribeFromTopic("users");
      FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
      myServices.sharedPreferences.clear();
      Get.offAllNamed(AppRoute.login);
    },
  ];

  List aboutMeContactInfo = [
    {
      'title': 'Call'.tr,
      'icon': FontAwesomeIcons.phone,
    },
    {
      'title': 'E-mail'.tr,
      'icon': Icons.email,
    },
    {
      'title': 'Instagram'.tr,
      'icon': FontAwesomeIcons.instagram,
    },
    {
      'title': 'Whatsapp'.tr,
      'icon': FontAwesomeIcons.whatsapp,
    }
  ];
  List<Function()> onTapAboutMe = [
    () async {
      await launchUrl(Uri.parse('tel: 009647510407010'));
    },
    () async {
      final Uri params = Uri(
        scheme: 'mailto',
        path: 'DCduhok.business@gmail.com',
        query: 'subject=Support Team&body=', //add subject and body here
      );

      var url = params.toString();
      // ignore: deprecated_member_use
      if (await canLaunch(url)) {
        // ignore: deprecated_member_use
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    },
    () async {
      await launchUrl(Uri.parse('https://www.instagram.com/dcduhok/'));
    },
    () async {
      final String url = 'https://www.instagram.com/dcduhok/';

      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    },
    () async {
      final link = WhatsAppUnilink(
        phoneNumber: '+9647510407010',
        text: "Hey! Can You Help Me...",
      );
      // ignore: deprecated_member_use
      await launch('$link');
    }
  ];
}
