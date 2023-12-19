// import 'package:dc_duhok/controller/productdetails_controller.dart';
// import 'package:dc_duhok/core/constant/app_theme.dart';
// import 'package:dc_duhok/core/constant/color.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SubitemsList extends GetView<ProductDetailsControllerImp> {
//   const SubitemsList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         ...List.generate(
//           controller.subitems.length,
//           (index) => Container(
//             margin: const EdgeInsets.only(right: 10),
//             alignment: Alignment.center,
//             padding: const EdgeInsets.only(bottom: 5),
//             height: 60,
//             width: 90,
//             decoration: BoxDecoration(
//                 color: controller.subitems[index]['active'] == "1"
//                     ? controller.subItemsColor[index]
//                     : Colors.white,
//                 border: Border.all(color: AppColor.fourthColor),
//                 borderRadius: BorderRadius.circular(10)),
//             child: Text(controller.subitems[index]['name'],
//                 style: titleStyle.copyWith(
//                     fontSize: 18, color:primaryColor)),
//           ),
//         )
//       ],
//     );
//   }
// }
