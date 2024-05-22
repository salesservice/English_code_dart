import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:flutter_isell_new/data/model/coupon_model.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/data/static/remote/favorite_data.dart';
import 'package:flutter_isell_new/data/static/remote/my_favorite_data.dart';
import 'package:flutter_isell_new/data/static/remote/ratings_data.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/classes/statusrequest.dart';
import '../core/functions/handling_data.dart';
import '../core/services/services.dart';
import '../data/static/remote/home_data.dart';

abstract class HomePageController extends GetxController {
  initialData();
  getdata();
  gotoitems(List kategorier, int selectedCat, int kategoriid, String katname);
  searchData();
}

MyServices myServices = Get.find();
late StatusRequest statusRequest;
FavorittData favorittData = FavorittData(Get.find());
RatingData ratingData = RatingData(Get.find());
MyFavorittData myfavorittData = MyFavorittData(Get.find());

class HomePageControllerImp extends HomePageController {
  MyServices myServices = Get.find();

  HomePageControllerImp() {
    _loadLastViewed();
  }
  List<Map<String, dynamic>> lastViewed = [];

  void addToLastViewed(Map<String, dynamic> itemMap) {
    if (lastViewed.length >= 10) {
      lastViewed.removeLast();
    }

    int newItemId = itemMap['item_id'];
    int duplicateIndex = -1;

    for (int i = 0; i < lastViewed.length; i++) {
      if (lastViewed[i]['item_id'] == newItemId) {
        duplicateIndex = i;
        break;
      }
    }

    if (duplicateIndex != -1) {
      Map<String, dynamic> duplicateItem = lastViewed.removeAt(duplicateIndex);
      lastViewed.insert(0, duplicateItem);
    } else {
      lastViewed.insert(0, itemMap);
    }

    _saveLastViewed();
  }

  Future<void> _saveLastViewed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> lastViewedJsonList =
        lastViewed.map((itemMap) => json.encode(itemMap)).toList();
    await prefs.setStringList('lastViewed', lastViewedJsonList);
  }

  Future<void> _loadLastViewed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> lastViewedJsonList = prefs.getStringList('lastViewed') ?? [];
    lastViewed = lastViewedJsonList
        .map((jsonString) => json.decode(jsonString) as Map<String, dynamic>)
        .toList();
  }

  List datafavoritt = [];

  List data = [];

  itemlikt(itemlikt, itemid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favorittData.itemlikt(itemlikt, itemid);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  String? userfname;
  String? userimage;
  String? useremail;
  int? userid;
  String? usercreate;
  int? userphone;

  HomeData homeData = HomeData(Get.find());

  //List data = [];
  List kategorier = [];
  List items = [];
  List allitems = [];
  final showClearIcon = false.obs;

  TextEditingController? search;
  // TextEditingController? searchfav;

  bool isSearch = false;
  checksearch(val) {
    if (val == '') {
      isSearch = false;
      searchData();
    }
    update();
  }

  onSearchitems() {
    isSearch = true;
    searchData();
    update();
  }

  checksearchFavoritter(val) {
    if (val == '') {
      isSearch = false;
      searchFavorittData();
      //searchData();
    }
    update();
  }

  onSearchFavoritter() {
    isSearch = true;
    searchFavorittData();
    //searchData();
    update();
  }

  List<ItemsModel> searchdata = [];
  List<ItemsModel> favorittsearchdata = [];

  late StatusRequest statusRequest;

  @override
  initialData() {
    userfname = myServices.sharedPreferences.getString("userfname");
    userimage = myServices.sharedPreferences.getString("userimage");
    useremail = myServices.sharedPreferences.getString("useremail");
    userid = myServices.sharedPreferences.getInt("id");
    usercreate = myServices.sharedPreferences.getString('usercreate');
    userphone = myServices.sharedPreferences.getInt('userphone');
    //statusRequest = StatusRequest.none;

    update();
  }

  @override
  void onInit() {
    getdata();
    getAllItems();
    //myFavoritt();

    search = TextEditingController();
    //searchfav = TextEditingController();
    coupon = TextEditingController();

    initialData();

    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    //print("==================================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        kategorier.addAll(response['kategorier']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  gotoitems(kategorier, selectedCat, kategoriid, katname) {
    Get.toNamed(
      AppRouter.items,
      arguments: {
        "kategorier": kategorier,
        "selectedcat": selectedCat,
        "kategoriid": kategoriid,
        "katname": katname,
      },
    );
  }

  @override
  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchsellxData(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        searchdata.clear();
        List responseData = response['data'];
        searchdata.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  searchFavorittData() async {
    statusRequest = StatusRequest.loading;
    var response = await favorittData.searchFavorittData(
        search!.text, myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        favorittsearchdata.clear();
        List responseData = response['data'];
        favorittsearchdata
            .addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getAllItems() async {
    statusRequest = StatusRequest.loading;
    var response =
        await homeData.getAallItems(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        allitems.clear();
        allitems.addAll(response['data']);
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

  void clearSearch() {
    search!.text = '';

    showClearIcon.value = false;
  }

  //==================================================betaling

  TextEditingController? coupon;
  GlobalKey<FormState> gkcoupon = GlobalKey<FormState>();
  int? discountcoupon = 0;
  String? couponname;
  CouponModel? couponModel;

  checkcoupon() async {
    var formdata = gkcoupon.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await homeData.checkCouponData(coupon!.text);
      statusRequest = handlingData(response);
      if (StatusRequest.suksess == statusRequest) {
        if (response['status'] == "success") {
          Map<String, dynamic> datacoupon = response['data'];
          couponModel = CouponModel.fromJson(datacoupon);
          discountcoupon = couponModel!.couponDiscount;
          couponname = couponModel!.couponName;
        } else {
          couponname = null;
          discountcoupon = 0;
        }
      }
      update();
    }
  }
  //==================================================rating

  submitRating(int userid, double rating, String comment) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ratingData.ratingData(
        myServices.sharedPreferences.getInt("id")!, rating, comment);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  itemsett(itemsett, itemid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await homeData.itemsett(itemsett, itemid);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
