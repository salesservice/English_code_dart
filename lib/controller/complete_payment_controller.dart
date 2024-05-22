import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:get/get.dart';

class CompletePaymentController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  String? betalingsmetode;

  VelgBetalingsMetode(String metode) {
    betalingsmetode = metode;
    update();
  }
}
