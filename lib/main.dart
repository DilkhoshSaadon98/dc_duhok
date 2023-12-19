import 'package:dc_duhok/bindings/intialbindings.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/localization/translation.dart';
import 'package:dc_duhok/core/services/services.dart';
import 'package:dc_duhok/core/theme/theme_service.dart';
import 'package:dc_duhok/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/localization/changelocal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return ScreenUtilInit(
        designSize: Size(context.width, context.height),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            translations: MyTranslation(),
            debugShowCheckedModeBanner: false,
            title: appName,
            //   locale: myServices.systemSharedPreferences.getString('lang') == null
            //       ? Get.deviceLocale
            //       : controller.language,
            locale: controller.language,
            theme: ThemeServices().lightTheme(),
            themeMode: ThemeServices().theme,
            darkTheme: ThemeServices().darkTheme(),
            initialBinding: InitialBindings(),
            getPages: routes,
          );
        });
  }
}
