import 'package:dc_duhok/core/constant/app_theme.dart';
import 'package:dc_duhok/core/constant/color.dart';
import 'package:dc_duhok/data/model/address_model.dart';
import 'package:dc_duhok/view/screen/address/components/single_row_address.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const CardAddress({Key? key, required this.addressModel, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Stack(
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: cartColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: .5,
                  color: myServices.sharedPreferences.getBool('mode') == true
                      ? white
                      : primaryColor),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1,
                  offset: Offset.fromDirection(BorderSide.strokeAlignOutside),
                  blurRadius: 1,
                  color: primaryColor,
                )
              ],
            ),
            child: ListTile(
                subtitle: Text(
                  "${addressModel.addressCity!} - ${addressModel.addressRegion} - ${addressModel.addressStreet}",
                  style: bodyStyle.copyWith(),
                ),
                //  ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(addressModel.addressName!,
                      style: titleStyle.copyWith(fontSize: 18)),
                ),
                leading: Icon(
                  FontAwesomeIcons.locationArrow,
                  color: myServices.sharedPreferences.getBool('mode') == true
                      ? white
                      : secondColor,
                ))),
        Container(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: const Icon(
              Icons.remove_circle,
              color: Colors.redAccent,
            ),
            onPressed: onDelete,
          ),
        ),
      ],
    ));
  }
}
