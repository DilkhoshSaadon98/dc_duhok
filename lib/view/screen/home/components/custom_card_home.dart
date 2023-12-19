import 'package:dc_duhok/controller/home_controller.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/functions/translatefatabase.dart';
import 'package:dc_duhok/data/model/our_offers.dart';
import 'package:dc_duhok/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final OurOffers ourOffers;
  const CustomCardHome(
    this.ourOffers, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: Get.width,
          height: 150,
          decoration: BoxDecoration(
            color: darkCardColor,
            border: Border.all(width: 1, color: secondColor),
            borderRadius: BorderRadius.circular(constRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 1,
                  child: FutureBuilder(
                    future: Future.value(LottieBuilder.asset(
                        '${AppLink.imagestItems}${ourOffers.offersImage!}')),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator(
                          color: secondColor,
                        );
                      } else if (snapshot.hasData) {
                        return LottieBuilder.network(
                            repeat: true,
                            '${AppLink.imagestItems}${ourOffers.offersImage!}');
                      } 
                        return Text('No data',style: bodyStyle.copyWith(color: secondColor),);
                    },
                  )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    translateDatabase(ourOffers.offersTitle1Ar,
                        ourOffers.offersTitle1, ourOffers.offersTitle1Ku),
                    style: bodyStyle.copyWith(fontSize: 16, color: white),
                  ),
                  Text(
                    translateDatabase(ourOffers.offersTitle2Ar,
                        ourOffers.offersTitle2, ourOffers.offersTitle2Ku),
                    style:
                        titleStyle.copyWith(fontSize: 20, color: secondColor),
                  ),
                  Text(
                    translateDatabase(ourOffers.offersTitle3Ar,
                        ourOffers.offersTitle3, ourOffers.offersTitle3Ku),
                    style: titleStyle.copyWith(fontSize: 20, color: white),
                  ),
                ],
              ))
            ],
          ),
        ),
        Container(
          alignment:
              myServices.systemSharedPreferences.getString('lang') == 'en'
                  ? Alignment.topRight
                  : Alignment.topLeft,
          margin: EdgeInsets.only(
            bottom: 10,
            top: 5,
            right: myServices.systemSharedPreferences.getString('lang') == 'en'
                ? 5
                : 0,
            left: myServices.systemSharedPreferences.getString('lang') != 'en'
                ? 5
                : 0,
          ),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: secondColor,
            child: IconButton(
              onPressed: () async {
                const link = WhatsAppUnilink(
                  phoneNumber: '+9647510407010',
                  text: "Hey! Can you tell me about DC DUHOK services...",
                );
                await launch('$link');
              },
              icon: Icon(
                FontAwesomeIcons.whatsapp,
                color: darkCardColor,
                size: 15,
              ),
            ),
          ),
        )
      ],
    );
  }
}
