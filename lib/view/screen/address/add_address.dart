import 'package:dc_duhok/controller/address/add_controller.dart';
import 'package:dc_duhok/core/class/handlingdataview.dart';
import 'package:dc_duhok/core/shared/custom_appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
      appBar: customAppBarTitle('Add Address', true),
      body: GetBuilder<AddAddressController>(
          builder: ((controllerpage) => HandlingDataView(
              statusRequest: controllerpage.statusRequest,
              widget: const Column(children: [
                // if (controllerpage.kGooglePlex != null)
                //   Expanded(
                //       child: Stack(
                //     alignment: Alignment.center,
                //     children: [
                //       GoogleMap(
                //         mapType: MapType.normal,
                //         markers: controllerpage.markers.toSet(),
                //         onTap: (latlong) {
                //           controllerpage.addMarkers(latlong);
                //         },
                //         initialCameraPosition: controllerpage.kGooglePlex!,
                //         onMapCreated: (GoogleMapController controllermap) {
                //           controllerpage.completercontroller!
                //               .complete(controllermap);
                //         },
                //       ),

                //     ],
                //   ))
              ])))),
    );
  }
}
