import 'package:dc_duhok/core/constant/routes.dart';
import 'package:dc_duhok/core/middleware/mymiddleware.dart';
import 'package:dc_duhok/view/screen/address/add_address.dart';
import 'package:dc_duhok/view/screen/address/add_details_address.dart';
import 'package:dc_duhok/view/screen/address/view_address.dart';
import 'package:dc_duhok/view/screen/auth/forgetpassword/forget_password_screen.dart';
import 'package:dc_duhok/view/screen/auth/login_screen.dart';
import 'package:dc_duhok/view/screen/auth/forgetpassword/reset_password_screen.dart';
import 'package:dc_duhok/view/screen/auth/signup_screen.dart';
import 'package:dc_duhok/view/screen/auth/forgetpassword/success_reset_password.dart';
import 'package:dc_duhok/view/screen/auth/success_signup_screen.dart';
import 'package:dc_duhok/view/screen/auth/forgetpassword/verify_code_reset_password.dart';
import 'package:dc_duhok/view/screen/auth/verify_code_signup_screen.dart';
import 'package:dc_duhok/view/screen/cart/cart_screen.dart';
import 'package:dc_duhok/view/screen/checkout/checkout_screen.dart';
import 'package:dc_duhok/view/main_screen.dart';
import 'package:dc_duhok/view/screen/home/display_all_items.dart';
import 'package:dc_duhok/view/screen/home/display_catagories_screen.dart';
import 'package:dc_duhok/view/screen/items/items_screen.dart';
import 'package:dc_duhok/view/screen/notifications/components/notification_details.dart';
import 'package:dc_duhok/view/screen/notifications/notification_screen.dart';
import 'package:dc_duhok/view/screen/orders/archive_screen.dart';
import 'package:dc_duhok/view/screen/setting/account_screen.dart';
import 'package:dc_duhok/view/screen/setting/language_screen.dart';
import 'package:dc_duhok/view/screen/offers/offers_screen.dart';
import 'package:dc_duhok/view/screen/favorite/myfavorite_screen.dart';
import 'package:dc_duhok/view/screen/on_boarding/onboarding.dart';
import 'package:dc_duhok/view/screen/orders/details_screen.dart';
import 'package:dc_duhok/view/screen/orders/pending_screen.dart';
import 'package:dc_duhok/view/screen/product_details/product_details_screen.dart';
import 'package:dc_duhok/view/screen/setting/components/myprofile.dart';
import 'package:dc_duhok/view/screen/setting/price_screen.dart';
import 'package:dc_duhok/view/screen/start_screen/splash_scree.dart';
import 'package:dc_duhok/view/screen/start_screen/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  //! Start Root :
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: "/",
      page: () => const StartScreen(),
      middlewares: [MyMiddleWare()]),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.startScreen,
      page: () => const StartScreen()),

  //!  Auth Roots :
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.login,
      page: () => const LoginScreen()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.signUp,
      page: () => const SignUpScreen()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.forgetPassword,
      page: () => const ForgetPasswordScreen()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.verfiyCode,
      page: () => const VerfiyCodeResetPassword()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.resetPassword,
      page: () => const ResetPassword()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.successSignUp,
      page: () => const SuccessSignUp()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.verfiyCodeSignUp,
      page: () => const VerfiyCodeSignUp()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.showAccount,
      page: () => const AccountScreen()),
  //! On Boarding Root
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.onBoarding,
      page: () => const OnBoarding()),
  //!Home Routes:
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.spalshScreen,
      page: () => const SplashScreen()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.homepage,
      page: () => const MainScreen()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.showItems,
      page: () => const DisplayAllItems()),
  GetPage(
      transition: Transition.circularReveal,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.items,
      page: () => const ItemsScreen()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.showCat,
      page: () => const DisplayAllCategories()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.offersPage,
      page: () => const OffersScreen()),

  //! Product Details :
  GetPage(
      transition: Transition.downToUp,
      curve: Curves.fastEaseInToSlowEaseOut,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.productdetails,
      page: () => const ProductDetails()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.myfavroite,
      page: () => const MyFavorite()),
  //! Address :
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.addressview,
      page: () => const AddressView()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.addressadd,
      page: () => const AddressAdd()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.addressadddetails,
      page: () => const AddressAddDetails()),
  //! Orders :
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.checkout,
      page: () => const Checkout()),
  //GetPage(name: AppRoute.offersProductDetails, page: () => const OffersProductDetails()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.ordersdetails,
      page: () => const OrdersDetails()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.orderspending,
      page: () => const OrdersPending()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.ordersarchive,
      page: () => const OrdersArchive()),
  //!Cart Routes :---------------------------------------------
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.cart,
      page: () => const CartScreen()),
  GetPage(
    transition: Transition.leftToRight,
    curve: Curves.decelerate,
    transitionDuration: const Duration(milliseconds: 500),
    name: AppRoute.myProfile,
    page: () => const MyProfile(),
  ),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.language,
      page: () => const LanguageScreen()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.deliveryPrice,
      page: () => const PriceScreen()),

  //! Notifications:
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.notificationRead,
      page: () => const NotificationDetailsScreen()),

  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.notificationView,
      page: () => const NotificationScreen()),
];
