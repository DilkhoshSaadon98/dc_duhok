import 'package:dc_duhok/controller/home_controller.dart';
import 'package:dc_duhok/core/class/handlingdataview.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/constant/routes.dart';
import 'package:dc_duhok/core/functions/login_confirm_dialog.dart';
import 'package:dc_duhok/core/shared/custom_sized_box.dart';
import 'package:dc_duhok/data/model/our_offers.dart';
import 'package:dc_duhok/view/screen/home/components/custom_card_home.dart';
import 'package:dc_duhok/view/screen/home/components/custom_title_home.dart';
import 'package:dc_duhok/view/screen/home/components/list_categories_home.dart';
import 'package:dc_duhok/view/screen/home/components/list_items_home.dart';
import 'package:dc_duhok/view/screen/home/components/new_arrival_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
              padding: EdgeInsets.symmetric(horizontal: constScreenPadding),
              child: ListView(
                children: [
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customSizedBox(20),
                          Row(
                            children: [
                              Text(
                                'Welcome, '.tr,
                                style: titleStyle.copyWith(
                                    color: myServices.sharedPreferences
                                                .getBool('mode') ==
                                            true
                                        ? white
                                        : primaryColor,
                                    fontSize: 26.sp,
                                    height: 1),
                              ),
                              Text(
                                myServices.sharedPreferences
                                            .getString('firstname')
                                            .toString()
                                            .capitalizeFirst ==
                                        'Null'
                                    ? 'Guest'
                                    : '${myServices.sharedPreferences.getString('firstname').toString().capitalizeFirst}',
                                style: titleStyle.copyWith(
                                    fontSize: 26.sp,
                                    color: secondColor,
                                    height: 1),
                              ),
                              const Spacer(),
                              myServices.sharedPreferences.getString('step') ==
                                      '1'
                                  ? GestureDetector(
                                      onTap: () {
                                        confirmLogin();
                                      },
                                      child: Text(
                                        'Log In'.tr,
                                        style: titleStyle.copyWith(
                                            color: Colors.teal,
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                          //! Home Card :
                          Container(
                            height: 150.h,
                            margin: EdgeInsets.symmetric(vertical: 15.h),
                            child: PageView.builder(
                              controller: controller.pageController,
                              itemCount: controller.ourOffers.length,
                              itemBuilder: (context, index) {
                                return CustomCardHome(OurOffers.fromJson(
                                    controller.ourOffers[index]));
                              },
                              onPageChanged: (index) {
                                controller.currentPageIndex = index;
                              },
                            ),
                          ),
                          //! Catagories List :
                          CustomTitleHome(
                            title: "All Categories".tr,
                            onTap: () {
                              Get.toNamed(AppRoute.showCat);
                            },
                          ),
                          const ListCategoriesHome(),
                          //! Items List :
                          CustomTitleHome(
                            title: "Products for you".tr,
                            onTap: () {
                              Get.toNamed(AppRoute.showItems,
                                  arguments: {'data': controller.items});
                            },
                          ),
                          const ListItemsHome(),
                          customSizedBox(),
                          //!TODO: Edting Latter :
                          controller.newArrivalItems.isEmpty
                              ? Container()
                              : CustomTitleHome(
                                  title: "New Arrival Products".tr,
                                  onTap: () {
                                    Get.toNamed(AppRoute.showItems, arguments: {
                                      'data': controller.newArrivalItems
                                    });
                                  },
                                ),
                          controller.newArrivalItems.isEmpty
                              ? Container()
                              : const NewArrivalItemsHome(),
                        ],
                      ))
                ],
              ),
            ));
  }
}
