import '../../../core/classes/crud.dart';
import '../../../sellx_link_api.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.homepage, {});
    return response.fold((l) => l, (r) => r);
  }

  searchsellxData(String search) async {
    var response = await crud.postData(AppLink.searchitems, {
      "search": search,
    });
    return response.fold((l) => l, (r) => r);
  }

  getAallItems(int userid) async {
    var response =
        await crud.postData(AppLink.allitems, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  checkCouponData(String coupncode) async {
    var response =
        await crud.postData(AppLink.checkcupon, {"coupncode": coupncode});
    return response.fold((l) => l, (r) => r);
  }

  itemsett(
    int itemsett,
    int itemid,
  ) async {
    var response = await crud.postData(AppLink.itemsett, {
      "itemsett": itemsett.toString(),
      "itemid": itemid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  // searchFavorittData(String search, int id) async {
  //   var response = await crud.postData(
  //       AppLink.searchfavoritt, {"search": search, "id": id.toString()});
  //   return response.fold((l) => l, (r) => r);
  // }

  searchFavorittData1(String search, int id) async {
    var response = await crud.postData(
        AppLink.searchfavoritt, {"search": search, "id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getbaby(int userid) async {
    var response =
        await crud.postData(AppLink.sellxbaby, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getklokker(int userid) async {
    var response = await crud
        .postData(AppLink.sellxklokker, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getsport(int userid) async {
    var response =
        await crud.postData(AppLink.sellxsport, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getkosmetikk(int userid) async {
    var response = await crud
        .postData(AppLink.sellxkosmetikk, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getbilletter(int userid) async {
    var response = await crud
        .postData(AppLink.sellxbilletter, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
