import 'package:dc_duhok/view/screen/home/home_screen.dart';
import 'package:dc_duhok/view/screen/notifications/notification_screen.dart';
import 'package:dc_duhok/view/screen/search/search_screen.dart';
import 'package:dc_duhok/view/screen/setting/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MainScreenController extends GetxController {
  changePage(int currentpage);
}

class MainScreenControllerImp extends MainScreenController {
  int currentpage = 0;
  PageController pageController = PageController(initialPage: 0);

  List<Widget> listPage = const [
    HomePageScreen(),
    SearchScreen(),
    //MessengerScreen(),
    //! It's For Space Between Bar Icons ...
    Spacer(),
    NotificationScreen(),
    Settings()
  ];

  List bottomappbar = [
    {
      "title": "Dashboard",
      "outlined_icon": Icons.home_outlined,
      'fiiled_icon': Icons.home
    },
    // {
    //   "title": "Messenger",
    //   "outlined_icon": Icons.message_outlined,
    //   'fiiled_icon': Icons.message
    // },
    {
      "title": "Search",
      "outlined_icon": Icons.search_outlined,
      'fiiled_icon': Icons.search
    },

    {"title": "Cart", "outlined_icon": Icons.abc, 'fiiled_icon': Icons.abc},
    {
      "title": "Notifi",
      "outlined_icon": Icons.notifications_active_outlined,
      'fiiled_icon': Icons.notifications_active
    },
    {
      "title": "Setting",
      "outlined_icon": Icons.settings_outlined,
      'fiiled_icon': Icons.settings
    }
  ];

  @override
  // ignore: avoid_renaming_method_parameters
  changePage(int index) {
    currentpage = index;
    update();
  }
}
