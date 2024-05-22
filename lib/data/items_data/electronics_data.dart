import 'dart:io';

import '../../../core/classes/crud.dart';
import '../../sellx_link_api.dart';

class ElectronicsItemData {
  Crud crud;

  ElectronicsItemData(this.crud);

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

  getpcskjermer(int userid) async {
    var response =
        await crud.postData(AppLink.pcskjerm, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  gethoyttaler(int userid) async {
    var response =
        await crud.postData(AppLink.hoyttaler, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getvrbriller(int userid) async {
    var response =
        await crud.postData(AppLink.vrbriller, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getiphonlader(int userid) async {
    var response =
        await crud.postData(AppLink.iphonlader, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getvaksemaskin(int userid) async {
    var response =
        await crud.postData(AppLink.vaskemaskin, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  gettorketrommel(int userid) async {
    var response = await crud
        .postData(AppLink.torketrommel, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getkjoleskap(int userid) async {
    var response =
        await crud.postData(AppLink.kjoleskap, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getovner(int userid) async {
    var response =
        await crud.postData(AppLink.ovner, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getharfoner(int userid) async {
    var response =
        await crud.postData(AppLink.harfoner, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getmikrobolgeovn(int userid) async {
    var response = await crud
        .postData(AppLink.mikrobolgeovn, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
