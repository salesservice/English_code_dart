import 'dart:io';

import '../../../core/classes/crud.dart';
import '../../sellx_link_api.dart';

class BicyclesItemData {
  Crud crud;

  BicyclesItemData(this.crud);

  addData(
    int userid,
    int katid,
    String itemaktiv,
    String itembeskrivelse,
    String itemname,
    String itempris,
    String itemmerke,
    String itemtistand,
    String sykkelbeskrivelse,
    String itemland,
    String itempostn,
    String itemby,
    String itemgata,
    String itemtelefon,
    String salgleie,
    String sykkeltype,
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
        "sykkelbeskrivelse": sykkelbeskrivelse,
        "itemland": itemland,
        "itempostn": itempostn,
        "itemby": itemby,
        "itemgata": itemgata,
        "itemtelefon": itemtelefon,
        "salgleie": salgleie,
        "sykkeltype": sykkeltype,
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

  getbmx(int userid) async {
    var response =
        await crud.postData(AppLink.bmx, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getcyclocross(int userid) async {
    var response =
        await crud.postData(AppLink.cyclocross, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getelektrisk(int userid) async {
    var response =
        await crud.postData(AppLink.elektriske, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getfulldamper(int userid) async {
    var response =
        await crud.postData(AppLink.fulldamper, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  gethybrid(int userid) async {
    var response =
        await crud.postData(AppLink.hybrid, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getlandvei(int userid) async {
    var response =
        await crud.postData(AppLink.landevei, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getterreng(int userid) async {
    var response =
        await crud.postData(AppLink.terreng, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getbarnesykkel(int userid) async {
    var response =
        await crud.postData(AppLink.barnesykkel, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getbysykkel(int userid) async {
    var response =
        await crud.postData(AppLink.bysykkel, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getsparkesykkel(int userid) async {
    var response = await crud
        .postData(AppLink.sparkesykkel, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  gettrehjulsykkel(int userid) async {
    var response = await crud
        .postData(AppLink.trehjulsykkel, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
