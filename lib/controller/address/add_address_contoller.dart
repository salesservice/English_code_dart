import 'dart:async';

import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  Completer<GoogleMapController> controller = Completer<GoogleMapController>();

  Position? position;

  CameraPosition? kGooglePlex;

  StatusRequest statusRequest = StatusRequest.loading;

  List<Marker> markers = [];

  double? lat;
  double? long;

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId('1'), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  goToAdressDetailsPage() {
    Get.toNamed(AppRouter.writeaddress, arguments: {
      "lat": lat.toString(),
      "long": long.toString(),
    });
  }

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    controller = Completer<GoogleMapController>();
    getCurrentLocation();
    super.onInit();
  }
}
