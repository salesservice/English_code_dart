import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/static/remote/address_data.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WriteAddressController extends GetxController {
  GlobalKey<FormState> gkaddress = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  TextEditingController? nummer;
  TextEditingController? gata;
  TextEditingController? city;
  TextEditingController? zip;
  TextEditingController? name;

  String? lat;
  String? long;

  //List data = [];

  AddressData addressData = AddressData(Get.find());

  initialData() {
    nummer = TextEditingController();
    gata = TextEditingController();
    city = TextEditingController();
    zip = TextEditingController();
    name = TextEditingController();

    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  addAddressData() async {
    var formdata = gkaddress.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addressData.addData(
          myServices.sharedPreferences.getInt("id")!,
          nummer!.text,
          city!.text,
          gata!.text,
          zip!.text,
          lat!,
          long!,
          name!.text);
      statusRequest = handlingData(response);
      if (StatusRequest.suksess == statusRequest) {
        if (response['status'] == "success") {
          Get.offAllNamed(AppRouter.homepage);
          Get.rawSnackbar(
              backgroundColor: Myisellcolors.appbar,
              titleText: Text("Obs!",
                  style: GoogleFonts.roboto(
                      fontSize: 17, color: Myisellcolors.hvit)),
              messageText: Text(
                  "En ny adresse ble lagt til under Dine adresser",
                  style: GoogleFonts.roboto(
                      fontSize: 17, color: Myisellcolors.hvit70)));
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }
}
