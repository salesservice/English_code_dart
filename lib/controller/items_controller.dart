import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/data/static/remote/items_data.dart';
import 'package:get/get.dart';

abstract class ItemController extends GetxController {
  initialData();
  changeCat(int val, int katval, String katname);
  getitems(int kategoriid);
  goToItemPageDetailsCar(ItemsModel itemsModel);
  goToItemPageDetailsEiendom(ItemsModel itemsModel);
  goToItemPageDetailsSellx(ItemsModel itemsModel);
  goToItemPageDetailsBoat(ItemsModel itemsModel);
  goToItemPageDetailsMC(ItemsModel itemsModel);
  goToItemPageDetailsSykkel(ItemsModel itemsModel);
  goToItemPageDetailsJobb(ItemsModel itemsModel);
  goToItemPageDetailsboker(ItemsModel itemsModel);
  goToItemPageDetailsmobler(ItemsModel itemsModel);
  goToItemPageDetailselektronikk(ItemsModel itemsModel);
  goToItemPageDetailsklar(ItemsModel itemsModel);
}

class ItemControllerImp extends ItemController {
  MyServices myServices = Get.find();
  ItemsData itemsData = ItemsData(Get.find());
  //FavorittData favorittData = FavorittData(Get.find());

  late StatusRequest statusRequest;

  final showClearIcon = false.obs;

  TextEditingController? search;
  bool isSearch = false;
  checksearch(val) {
    if (val == '') {
      statusRequest = StatusRequest.none;
      isSearch = false;
      searchDataItems(kategoriid);
    }
    update();
  }

  onSearchitems() {
    isSearch = true;
    searchDataItems(kategoriid);
    update();
  }

  void clearSearch() {
    search!.text = '';

    showClearIcon.value = false;
  }

  List<ItemsModel> searchdataitems = [];

  searchDataItems(kategoriid) async {
    statusRequest = StatusRequest.loading;
    var response = await itemsData.searchsellxData(search!.text, kategoriid);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        searchdataitems.clear();
        List responseData = response['data'];
        searchdataitems.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  RxBool showRelevant1 = true.obs;
  Icon getIcon() {
    return showRelevant1.value
        ? const Icon(
            Icons.grid_view_rounded,
            size: 24,
            color: Myisellcolors.hvit,
          )
        : const Icon(
            Icons.view_stream_rounded,
            size: 24,
            color: Myisellcolors.hvit,
          );
  }

  List kategorier = [];
  List data = [];
  List<ItemsModel> allitems = [];

  int? selectedCat;
  int? kategoriid;
  String? katname;

  @override
  initialData() {
    kategorier = Get.arguments['kategorier'];
    selectedCat = Get.arguments['selectedcat'];
    kategoriid = Get.arguments['kategoriid'];
    katname = Get.arguments['katname'];
    getitems(kategoriid!);
    searchDataItems(kategoriid);
  }

  @override
  void onInit() {
    search = TextEditingController();

    initialData();
    super.onInit();
  }

  @override
  changeCat(val, katval, katn) {
    selectedCat = val;
    kategoriid = katval;
    katname = katn;
    getitems(kategoriid!);
    searchDataItems(kategoriid);

    update();
  }

  @override
  getitems(kategoriid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getItems(
        kategoriid, myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        // myServices.sharedPreferences
        //     .setString("itemid", response['data']['item_id']);
        data.clear();
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItemPageDetailsCar(ItemsModel itemsModel) {
    Get.toNamed(AppRouter.itemdetailscar,
        arguments: {"itemsmodel": itemsModel});
  }

  @override
  goToItemPageDetailsEiendom(ItemsModel itemsModel) {
    Get.toNamed(AppRouter.itemdetailseiendom, arguments: {
      "itemsmodel": itemsModel,
    });
  }

  @override
  goToItemPageDetailsSellx(ItemsModel itemsModel) {
    Get.toNamed(AppRouter.itemdetailssellx,
        arguments: {"itemsmodel": itemsModel});
  }

  @override
  goToItemPageDetailsBoat(ItemsModel itemsModel) {
    Get.toNamed(AppRouter.itemdetailsboat,
        arguments: {"itemsmodel": itemsModel});
  }

  @override
  goToItemPageDetailsMC(ItemsModel itemsModel) {
    Get.toNamed(AppRouter.itemdetailsmc, arguments: {"itemsmodel": itemsModel});
  }

  @override
  goToItemPageDetailsSykkel(ItemsModel itemsModel) {
    Get.toNamed(AppRouter.itemdetailssykkel,
        arguments: {"itemsmodel": itemsModel});
  }

  @override
  goToItemPageDetailsJobb(ItemsModel itemsModel) {
    Get.toNamed(AppRouter.itemdetailsjobb,
        arguments: {"itemsmodel": itemsModel});
  }

  @override
  goToItemPageDetailsboker(ItemsModel itemsModel) {
    Get.toNamed(AppRouter.itemdetailsboker,
        arguments: {"itemsmodel": itemsModel});
  }

  @override
  goToItemPageDetailsmobler(ItemsModel itemsModel) {
    Get.toNamed(AppRouter.itemdetailsmobler,
        arguments: {"itemsmodel": itemsModel});
  }

  @override
  goToItemPageDetailselektronikk(ItemsModel itemsModel) {
    Get.toNamed(AppRouter.itemdetailselektronikk,
        arguments: {"itemsmodel": itemsModel});
  }

  @override
  goToItemPageDetailsklar(ItemsModel itemsModel) {
    Get.toNamed(AppRouter.itemdetailsklar,
        arguments: {"itemsmodel": itemsModel});
  }

  void goToItemPageDetails(ItemsModel itemsModel) {
    switch (itemsModel.itemKat) {
      case 1:
        goToItemPageDetailsSellx(itemsModel);
        break;
      case 2:
        goToItemPageDetailsEiendom(itemsModel);
        break;
      case 3:
        goToItemPageDetailsCar(itemsModel);
        break;
      case 4:
        goToItemPageDetailsBoat(itemsModel);
        break;
      case 5:
        goToItemPageDetailsMC(itemsModel);
        break;
      case 6:
        goToItemPageDetailsSykkel(itemsModel);
        break;
      case 7:
        goToItemPageDetailsJobb(itemsModel);
        break;
      case 8:
        goToItemPageDetailsboker(itemsModel);
        break;
      case 9:
        goToItemPageDetailsmobler(itemsModel);
        break;
      case 10:
        goToItemPageDetailselektronikk(itemsModel);
        break;
      case 11:
        goToItemPageDetailsklar(itemsModel);
        break;
      default:
        // Handle the default case or provide an error message.
        break;
    }
  }

  // Map isFavorite = {};
  // setFavorite(id, val) {
  //   isFavorite[id] = val;
  //   update();
  // }

  // addFavoritt(itemid) async {
  //   data.clear();
  //   statusRequest = StatusRequest.loading;
  //   var response = await itemsData.addFavoritt(
  //       myServices.sharedPreferences.getInt("id")!, itemid);
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.suksess == statusRequest) {
  //     if (response['status'] == "success") {
  //       Get.rawSnackbar(
  //           backgroundColor: Myisellcolors.appbar,
  //           titleText: Text("Obs!",
  //               style: GoogleFonts.roboto(
  //                   fontSize: 17, color: Myisellcolors.hvit)),
  //           messageText: Text("Annonsen ble lagt til under dine favoritter",
  //               style: GoogleFonts.roboto(
  //                   fontSize: 17, color: Myisellcolors.hvit70)));
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  // }

  // removeFavoritt(itemid) async {
  //   data.clear();
  //   statusRequest = StatusRequest.loading;
  //   var response = await itemsData.removeFavoritt(
  //       myServices.sharedPreferences.getInt("id")!, itemid);
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.suksess == statusRequest) {
  //     if (response['status'] == "success") {
  //       Get.rawSnackbar(
  //           backgroundColor: Myisellcolors.appbar,
  //           titleText: Text("Obs!",
  //               style: GoogleFonts.roboto(
  //                   fontSize: 17, color: Myisellcolors.hvit)),
  //           messageText: Text(
  //             "Annonsen fjernet fra dine favoritter",
  //             style:
  //                 GoogleFonts.roboto(fontSize: 17, color: Myisellcolors.hvit70),
  //           ));
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  // }

  // itemlikt(itemlikt, itemid) async {
  //   data.clear();
  //   statusRequest = StatusRequest.loading;
  //   var response = await itemsData.itemlikt(itemlikt, itemid);
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.suksess == statusRequest) {
  //     if (response['status'] == "success") {
  //       //data.addAll(response['data']);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }
}
