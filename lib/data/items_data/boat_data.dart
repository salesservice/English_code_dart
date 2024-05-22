import 'dart:io';

import '../../../core/classes/crud.dart';
import '../../sellx_link_api.dart';

class BoatItemsData {
  Crud crud;

  BoatItemsData(this.crud);

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
    String boattype,
    String boatliggeri,
    String boatregnr,
    String boatmodellar,
    String boatmerke,
    String boatmotorinc,
    String boatmodell,
    String boatmotortype,
    String boatmotormerke,
    String boathk,
    String boatfartiknop,
    String boatdrivstoff,
    String boatlengdefot,
    String boatbreddecm,
    String boatdybdecm,
    String boatvektkg,
    String boatbyggematerial,
    String boatfarge,
    String boatsitteplasser,
    String boatsoveplasser,
    String boatlystall,
    String boatutstyr,
    String boatbeskrivevlse,
    String boatvideo,
    String itemselger,
    String kontaktperson,
    String boatbeliggenhet,
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
        "boattype": boattype,
        "boatliggeri": boatliggeri,
        "boatregnr": boatregnr,
        "boatmodellar": boatmodellar,
        "boatmerke": boatmerke,
        "boatmotorinc": boatmotorinc,
        "boatmodell": boatmodell,
        "boatmotortype": boatmotortype,
        "boatmotormerke": boatmotormerke,
        "boathk": boathk,
        "boatfartiknop": boatfartiknop,
        "boatdrivstoff": boatdrivstoff,
        "boatlengdefot": boatlengdefot,
        "boatbreddecm": boatbreddecm,
        "boatdybdecm": boatdybdecm,
        "boatvektkg": boatvektkg,
        "boatbyggematerial": boatbyggematerial,
        "boatfarge": boatfarge,
        "boatsitteplasser": boatsitteplasser,
        "boatsoveplasser": boatsoveplasser,
        "boatlystall": boatlystall,
        "boatutstyr": boatutstyr,
        "boatbeskrivevlse": boatbeskrivevlse,
        "boatvideo": boatvideo,
        "itemselger": itemselger,
        "kontaktperson": kontaktperson,
        "boatbeliggenhet": boatbeliggenhet,
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

  getbowrider(int userid) async {
    var response =
        await crud.postData(AppLink.bowrider, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getcabincruiser(int userid) async {
    var response = await crud
        .postData(AppLink.cabincruiser, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getdaycruiser(int userid) async {
    var response =
        await crud.postData(AppLink.daycruiser, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getgummi(int userid) async {
    var response =
        await crud.postData(AppLink.gummiboat, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getrib(int userid) async {
    var response =
        await crud.postData(AppLink.rib, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getseilboat(int userid) async {
    var response =
        await crud.postData(AppLink.seilboat, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getskjargardsjeep(int userid) async {
    var response = await crud
        .postData(AppLink.skjargardsjeep, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getpilothouse(int userid) async {
    var response =
        await crud.postData(AppLink.pilothouse, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getspeedboat(int userid) async {
    var response =
        await crud.postData(AppLink.speedboat, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  gettreboat(int userid) async {
    var response =
        await crud.postData(AppLink.treboat, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getyacht(int userid) async {
    var response =
        await crud.postData(AppLink.yacht, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getvannscooter(int userid) async {
    var response =
        await crud.postData(AppLink.vannscooter, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getyrkesboat(int userid) async {
    var response =
        await crud.postData(AppLink.yrkesboat, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
