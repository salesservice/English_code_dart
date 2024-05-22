import 'dart:io';

import '../../../core/classes/crud.dart';
import '../../sellx_link_api.dart';

class BooksItemsData {
  Crud crud;

  BooksItemsData(this.crud);

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
    String bokkategori,
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
        "bokkategori": bokkategori,
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

  getvideregoende(int userid) async {
    var response = await crud
        .postData(AppLink.videregoende, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getuniversitet(int userid) async {
    var response =
        await crud.postData(AppLink.universitet, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getbarneboker(int userid) async {
    var response =
        await crud.postData(AppLink.barneboker, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getromaner(int userid) async {
    var response =
        await crud.postData(AppLink.romaner, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
