import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  MyServices myServices = Get.find();
  final _box = GetStorage();
  final _key = 'isDarkMode';
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  ThemeMode get theme => myServices.sharedPreferences.getBool('mode') == true
      ? ThemeMode.dark
      : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
    myServices.sharedPreferences.setBool('mode', _loadThemeFromBox());
    // changeThemeColor(myServices.sharedPreferences.getBool('mode')!);
  }

  ThemeData lightTheme() {
    return ThemeData(

        //! Divider
        dividerColor: primaryColor,
        //! Card Theme:
        cardTheme: CardTheme(
          elevation: 1,
          color: white,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            side: BorderSide(color: primaryColor, width: 1),
          ),
        ),
        //! App Bar Theme:
        appBarTheme: AppBarTheme(
            titleTextStyle: titleStyle.copyWith(
                fontSize: 25,
                color: AppColor.secondColor,
                fontWeight: FontWeight.bold),
            color: primaryColor,
            iconTheme: const IconThemeData(color: secondColor)),
        //! Floating Action Button Color:
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 5,
            backgroundColor: darkBackgroundColor,
            foregroundColor: secondColor),
        //! Scaffold:
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
            bodyLarge: titleStyle.copyWith(
                fontSize: 26, color: darkBackgroundColor, height: 1)));
  }

  ThemeData darkTheme() {
    return ThemeData(
      //! Divider
      dividerColor: secondColor,
      //! Card Theme:
      cardTheme: const CardTheme(
        elevation: 1,
        color: black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          side: BorderSide(color: Colors.white, width: 1),
        ),
      ),
      //! App Bar Theme:
      appBarTheme: AppBarTheme(
          titleTextStyle: titleStyle.copyWith(
              fontSize: 25,
              color: AppColor.secondColor,
              fontWeight: FontWeight.bold),
          color: black,
          iconTheme: const IconThemeData(color: secondColor)),
      //! Floating Action Button Color:
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 5,
          backgroundColor: darkBackgroundColor,
          foregroundColor: secondColor),
      //! Scaffold:
      scaffoldBackgroundColor: black,
      //! Text Style:
      textTheme: TextTheme(
          bodyLarge: titleStyle.copyWith(fontSize: 26, color: white, height: 1),
          bodyMedium:
              titleStyle.copyWith(fontSize: 26, color: white, height: 1)),
    );
  }
}
