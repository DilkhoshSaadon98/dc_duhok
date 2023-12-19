import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/constant/imgaeasset.dart';
import 'package:dc_duhok/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: AnimatedSplashScreen(
                backgroundColor:
                    myServices.sharedPreferences.getBool('mode') == true
                        ? black
                        : white,
                splashIconSize: 250,
                splash: Image.asset(
                  AppImageAsset.logo,
                ),
                //  LottieBuilder.asset(
                //   AppImageAsset.login,
                //   animate: true,
                //   width: 350,
                //   height: 100,
                //   alignment: Alignment.center,
                // ),
                nextScreen: MainScreen(),
                duration: 2000,
                splashTransition: SplashTransition.fadeTransition,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: CircularProgressIndicator(
                backgroundColor: primaryColor,
                color: secondColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
