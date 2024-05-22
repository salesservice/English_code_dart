import '../../../core/classes/crud.dart';
import '../../../sellx_link_api.dart';

class ItemsData {
  Crud crud;

  ItemsData(this.crud);

  getItems(int id, int userid) async {
    var response = await crud.postData(
        AppLink.items, {"id": id.toString(), "userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  searchsellxData(String search, int id) async {
    var response = await crud
        .postData(AppLink.searchsellx, {"search": search, "id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
