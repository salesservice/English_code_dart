import 'dart:io';

import '../../../core/classes/crud.dart';
import '../../sellx_link_api.dart';

class ClothesItemData {
  Crud crud;

  ClothesItemData(this.crud);

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

  getsko(int userid) async {
    var response =
        await crud.postData(AppLink.sko, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getvinterjakker(int userid) async {
    var response = await crud
        .postData(AppLink.vinterjakker, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getbukser(int userid) async {
    var response =
        await crud.postData(AppLink.bukser, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  gettskjorter(int userid) async {
    var response =
        await crud.postData(AppLink.tskjorter, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getfrakker(int userid) async {
    var response =
        await crud.postData(AppLink.frakker, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getdresser(int userid) async {
    var response =
        await crud.postData(AppLink.dresser, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getkjoler(int userid) async {
    var response =
        await crud.postData(AppLink.kjoler, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getvester(int userid) async {
    var response =
        await crud.postData(AppLink.vester, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getskjorter(int userid) async {
    var response =
        await crud.postData(AppLink.skjorter, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getturbukser(int userid) async {
    var response =
        await crud.postData(AppLink.turbukser, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
