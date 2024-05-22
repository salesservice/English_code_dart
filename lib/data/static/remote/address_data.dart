import '../../../core/classes/crud.dart';
import '../../../sellx_link_api.dart';

class AddressData {
  Crud crud;

  AddressData(this.crud);

  viewData(int userid) async {
    var response = await crud
        .postData(AppLink.addrressview, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  addData(int userid, String nummer, String city, String street, String zip,
      String lat, String long, String name) async {
    var response = await crud.postData(AppLink.addrressadd, {
      "userid": userid.toString(),
      "nummer": nummer,
      "city": city,
      "street": street,
      "zip": zip,
      "lat": lat,
      "long": long,
      "name": name
    });
    return response.fold((l) => l, (r) => r);
  }

  editData() async {
    var response = await crud.postData(AppLink.addrressedit, {});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(int addressid) async {
    var response = await crud
        .postData(AppLink.addrressdelete, {"addressid": addressid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
