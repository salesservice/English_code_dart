import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/model/address_model.dart';
import 'package:flutter_isell_new/data/static/remote/address_data.dart';
import 'package:get/get.dart';

class ViewAddressController extends GetxController {
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  List<AddressModel> data = [];

  AddressData addressData = AddressData(Get.find());

  @override
  void onInit() {
    viewAddressData();
    super.onInit();
  }

  viewAddressData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.viewData(
      myServices.sharedPreferences.getInt("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        List addresslist = response['data'];
        data.addAll(addresslist.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteAddress(int addressid) async {
    addressData.deleteData(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    update();
  }
}
