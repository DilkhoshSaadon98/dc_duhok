import 'package:dc_duhok/core/functions/formating_numbers.dart';
import 'package:dc_duhok/data/model/deleviry_price_model.dart';
import 'package:get/get.dart';

List<DeleviryPriceModel> deleviryPriceList = [
  DeleviryPriceModel(
      title: "Duhok".tr,
      body:
          "Center of Duhok city"
              .tr,
      price: formattingNumbers(3000)),
  DeleviryPriceModel(
      title: "Duhok".tr,
      body:
          "Around of Duhok city"
              .tr,
      price: formattingNumbers(5000)),
  DeleviryPriceModel(
      title: "Sulaymaniyah".tr,
      body:
          "Center of Sulaymaniyah city"
              .tr,
      price: formattingNumbers(5250)),
  DeleviryPriceModel(
      title: "Sulaymaniyah".tr,
      body:
          "Around of Sulaymaniyah city"
              .tr,
      price: formattingNumbers(5500)),
];
