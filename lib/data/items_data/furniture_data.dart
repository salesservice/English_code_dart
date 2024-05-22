import 'dart:io';

import '../../../core/classes/crud.dart';
import '../../sellx_link_api.dart';

class FurnitureItemData {
  Crud crud;

  FurnitureItemData(this.crud);

  addData(
    int userid,
    int katid,
    String itemaktiv,
    String itembeskrivelse,
    String itemname,
    String itempris,
    String itemmerke,
    String itemtistand,
    String sellxbeskrivelse,
    String itemland,
    String itempostn,
    String itemby,
    String itemgata,
    String itemtelefon,
    String salgleie,
    String nokkelord,
    List<File?> imagenames,
  ) async {
    var response = await crud.addRequestWithMultipleImages(
      AppLink.addannonse,
      {
        "userid": userid.toString(),
        "katid": katid.toString(),
        "itemaktiv": itemaktiv,
        "itemname": itemname,
        "itembeskrivelse": itembeskrivelse,
        "itempris": itempris,
        "itemmerke": itemmerke,
        "itemtistand": itemtistand,
        "sellxbeskrivelse": sellxbeskrivelse,
        "itemland": itemland,
        "itempostn": itempostn,
        "itemby": itemby,
        "itemgata": itemgata,
        "itemtelefon": itemtelefon,
        "salgleie": salgleie,
        "nokkelord": nokkelord,
        // "imagename": imagename,
      },
      imagenames.cast<File>(),
    );
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

  getsenger(int userid) async {
    var response =
        await crud.postData(AppLink.senger, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getsofaer(int userid) async {
    var response =
        await crud.postData(AppLink.sofaer, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  gettepper(int userid) async {
    var response =
        await crud.postData(AppLink.tepper, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getspisebord(int userid) async {
    var response =
        await crud.postData(AppLink.spisebord, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getkleskap(int userid) async {
    var response =
        await crud.postData(AppLink.klesskap, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getlampe(int userid) async {
    var response =
        await crud.postData(AppLink.lampe, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getspeil(int userid) async {
    var response =
        await crud.postData(AppLink.speil, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getstoler(int userid) async {
    var response =
        await crud.postData(AppLink.stoler, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getpeis(int userid) async {
    var response =
        await crud.postData(AppLink.peis, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getmaleri(int userid) async {
    var response =
        await crud.postData(AppLink.maleri, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
