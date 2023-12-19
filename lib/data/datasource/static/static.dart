import 'package:dc_duhok/core/constant/imgaeasset.dart';
import 'package:dc_duhok/data/model/onboarding_model.dart';
import 'package:get/get_utils/get_utils.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "Welcome to Your Arduino Adventure!".tr,
      body:
          "Get ready to explore the world of Arduino with our online store. Shop and bring your ideas to life with confidence."
              .tr,
      image: AppImageAsset.onBoardingImageOne),
  OnBoardingModel(
      title: "Your Gateway to Arduino Creations!".tr,
      body:
          "Explore our online Arduino store for components, sensors, and more. From hobbyists to pros, we're your one-stop shop for Arduino. Join our electronic adventure"
              .tr,
      image: AppImageAsset.onBoardingImageTwo),
  OnBoardingModel(
      title: "Delivering Delight to Your Doorstep!".tr,
      body:
          "Experience seamless and secure online shopping delivery with us. Enjoy fast, reliable service, and focus on your shopping experience"
              .tr,
      image: AppImageAsset.onBoardingImageThree),
  OnBoardingModel(
      title: "Discover Irresistible Savings!".tr,
      body:
          "Discover savings and special deals in our online store to enhance your shopping experience. Enjoy affordable and enjoyable shopping with us.",
      image: AppImageAsset.onBoardingImageFour),
];
