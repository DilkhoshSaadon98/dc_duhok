import 'package:cached_network_image/cached_network_image.dart';
import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/core/functions/formating_numbers.dart';
import 'package:dc_duhok/linkapi.dart';
import 'package:flutter/material.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomItemsCartList({
    Key? key,
    required this.name,
    required this.price,
    required this.count,
    required this.imagename,
    required this.onAdd,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        color: myServices.sharedPreferences.getBool('mode') != true
            ? white
            : black,
        elevation: 2,
        shadowColor: primaryColor,
        shape: ContinuousRectangleBorder(
            side: BorderSide(width: .5, color: primaryColor),
            borderRadius: BorderRadius.circular(15)),
        child: Row(children: [
          Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: "${AppLink.imagestItems}/$imagename",
                height: 80,
              )),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text(name, style: titleStyle.copyWith(fontSize: 16)),
                ),
                subtitle: Text(formattingNumbers(int.parse(price)),
                    style: numberStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w700)),
              )),
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: onAdd,
                  icon: CircleAvatar(
                    backgroundColor: primaryColor,
                    radius: 15,
                    child: const Icon(
                      size: 20,
                      Icons.add,
                      color: secondColor,
                    ),
                  )),
              Text(
                count,
                style: numberStyle.copyWith(fontSize: 20),
              ),
              IconButton(
                  onPressed: onRemove,
                  icon: CircleAvatar(
                    radius: 15,
                    backgroundColor: const Color.fromARGB(255, 255, 134, 134),
                    child: Icon(
                      size: 20,
                      Icons.remove,
                      color: primaryColor,
                    ),
                  ))
            ],
          ))
        ]),
      ),
    );
  }
}
