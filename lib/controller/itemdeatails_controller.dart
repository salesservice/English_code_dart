import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:get/get.dart';

abstract class ItemDetailsController extends GetxController {}

class ItemDetailsControllerImp extends ItemDetailsController {
  late ItemsModel itemsModel;
  //late FavorittModel favorittModel;

  final RxInt selectedImageIndex = 0.obs;

  void updateSelectedIndex(int index) {
    selectedImageIndex.value = index;
    update(); // Make sure this update method is called.
  }

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  List<String> cardata = [
    "Kilometer",
    "Girkasse",
    "Drivstofftype",
    "Modell",
    "Effekt",
    "Neste EU-frist",
  ];

  List<String> cardatapic = [
    "assets/images/kmcar.png",
    "assets/images/gear.png",
    "assets/images/gas.png",
    "assets/images/kalander.png",
    "assets/images/hest.png",
    "assets/images/bileu.png"
  ];

  List<String> eiendomdata = [
    "Boligtype",
    "Eieform",
    "Soverom",
    "Byggeår",
    "Energimerking",
  ];

  List<String> eiendomdatapic = [
    "assets/images/home.png",
    "assets/images/contract.png",
    "assets/images/seng.png",
    "assets/images/kalander.png",
    "assets/images/energi.png",
  ];

  List<String> boatdata = [
    "Motortype",
    "Lengde",
    "Drivstofftype",
    "Modell",
    "Effekt",
  ];
  List<String> boatdatapic = [
    "assets/images/boatmotor.png",
    "assets/images/boatlength.png",
    "assets/images/gas.png",
    "assets/images/kalander.png",
    "assets/images/hest.png",
  ];

  List<String> mcdata = [
    "Kilometer",
    "Effekt",
    // "Slagvolum",
    "Drivstofftype",
    "Modell",
  ];

  List<String> mcdatapic = [
    "assets/images/kmcar.png",
    "assets/images/hest.png",
    // "assets/images/gear.png",
    "assets/images/gas.png",
    "assets/images/kalander.png",
  ];

  List<String> jobbdata = [
    "Ansettelsesform",
    "Sektor",
    "Firma         ",
    "Antall Stillinger",
    "Frist         ",
  ];

  List<String> jobbdatapic = [
    "assets/images/contract.png",
    "assets/images/sector.png",
    "assets/images/selskap.png",
    "assets/images/group.png",
    "assets/images/kalander.png",
  ];

  initialdata() {
    itemsModel = Get.arguments['itemsmodel'];
    statusRequest = StatusRequest.none;
    //favorittModel = Get.arguments['favorittModel'];
  }

  @override
  void onInit() {
    initialdata();
    super.onInit();
  }
}
