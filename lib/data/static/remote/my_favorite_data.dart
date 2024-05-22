import '../../../core/classes/crud.dart';
import '../../../sellx_link_api.dart';

class MyFavorittData {
  Crud crud;

  MyFavorittData(this.crud);

  getData(int id) async {
    var response =
        await crud.postData(AppLink.myfavorits, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  deleteMyfavoritt(int id) async {
    var response =
        await crud.postData(AppLink.deletemyfavorits, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
