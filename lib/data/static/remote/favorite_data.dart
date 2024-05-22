import '../../../core/classes/crud.dart';
import '../../../sellx_link_api.dart';

class FavorittData {
  Crud crud;

  FavorittData(this.crud);

  addFavoritt(int userid, int itemid) async {
    var response = await crud.postData(AppLink.addfavoritt,
        {"userid": userid.toString(), "itemid": itemid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  removeFavoritt(int userid, int itemid) async {
    var response = await crud.postData(AppLink.removefavoritt,
        {"userid": userid.toString(), "itemid": itemid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  itemlikt(
    int itemlikt,
    int itemid,
  ) async {
    var response = await crud.postData(AppLink.getitemlikt, {
      "itemlikt": itemlikt.toString(),
      "itemid": itemid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  searchFavorittData(String search, int id) async {
    var response = await crud.postData(
        AppLink.searchfavoritt, {"search": search, "id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
