import 'dart:io';

import 'package:flutter_isell_new/core/classes/crud.dart';
import 'package:flutter_isell_new/sellx_link_api.dart';

class CarsItemsData {
  Crud crud;

  CarsItemsData(this.crud);

  addData(
    int userid,
    int katid,
    String itemaktiv,
    String itembeskrivelse,
    String itemname,
    String itempris,
    String itemmerke,
    String cartilstand,
    String sellxbeskrivelse,
    String itemland,
    String itempostn,
    String itemby,
    String itemgata,
    String itemtelefon,
    String salgleie,
    String carregnummer,
    String carchassis,
    String carmodellar,
    String carmerke,
    String carmodell,
    String carstar,
    String cardrivstoff,
    String carsylindervolum,
    String careffekt,
    String cartrimmet,
    String whytrimmet,
    String carco2utslipp,
    String carbattericp,
    String carrekkevidde,
    String cargirkasse,
    String cargirbetegnelse,
    String carhjuledrift,
    String carhjuledriftbetegnese,
    String karosseritype,
    String avgiftklasse,
    String antallseter,
    String antalldor,
    String bagasjeromvolum,
    String egenvektkg,
    String makstilhengervekt,
    String carfarge,
    String fargebeskrivelse,
    String interiorfarge,
    String carutstyr,
    String carkilometer,
    String carfeil,
    String hvafeil,
    String carreparasjon,
    String hvareparasjon,
    String forstegangsreg,
    String antalleiere,
    String sistecareu,
    String nesteeufrist,
    String garantitype,
    String linkvideo,
    String carbeskrivelse,
    String fritakfracaromreg,
    String omregnetavgift,
    String cargjeld,
    String hvagjeld,
    String itemselger,
    String startleiecar,
    String manedsbelopcar,
    String gjenvarendekjoredistanse,
    String debitorskiftegebyrikr,
    String avtalensutlopsdato,
    String antallmonedertilavtalenutloper,
    String leieselskap,
    String stedforlevering,
    String cartype,
    String biltotalvekt,
    String biltotallengde,
    String bilinnvendiglengde,
    String bilbredde,
    String harbilentilstandsrapport,
    String harbilengaranti,
    String sengtype,
    String carvedlikeholdsprogram,
    String bilsoveplasser,
    String kontaktperson,
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
        "cartilstand": cartilstand,
        "sellxbeskrivelse": sellxbeskrivelse,
        "itemland": itemland,
        "itempostn": itempostn,
        "itemby": itemby,
        "itemgata": itemgata,
        "itemtelefon": itemtelefon,
        "salgleie": salgleie,
        "carregnummer": carregnummer,
        "carchassis": carchassis,
        "carmodellar": carmodellar,
        "carmerke": carmerke,
        "carmodell": carmodell,
        "carstar": carstar,
        "cardrivstoff": cardrivstoff,
        "carsylindervolum": carsylindervolum,
        "careffekt": careffekt.toString(),
        "cartrimmet": cartrimmet,
        "whytrimmet": whytrimmet,
        "carco2utslipp": carco2utslipp,
        "carbattericp": carbattericp,
        "carrekkevidde": carrekkevidde,
        "cargirkasse": cargirkasse,
        "cargirbetegnelse": cargirbetegnelse,
        "carhjuledrift": carhjuledrift,
        "carhjuledriftbetegnese": carhjuledriftbetegnese,
        "karosseritype": karosseritype,
        "avgiftklasse": avgiftklasse,
        "antallseter": antallseter,
        "antalldor": antalldor,
        "bagasjeromvolum": bagasjeromvolum,
        "egenvektkg": egenvektkg,
        "makstilhengervekt": makstilhengervekt,
        "carfarge": carfarge,
        "fargebeskrivelse": fargebeskrivelse,
        "interiorfarge": interiorfarge,
        "carutstyr": carutstyr,
        "carkilometer": carkilometer,
        "carfeil": carfeil,
        "hvafeil": hvafeil,
        "carreparasjon": carreparasjon,
        "hvareparasjon": hvareparasjon,
        "forstegangsreg": forstegangsreg,
        "antalleiere": antalleiere,
        "sistecareu": sistecareu,
        "nesteeufrist": nesteeufrist,
        "garantitype": garantitype,
        "linkvideo": linkvideo,
        "carbeskrivelse": carbeskrivelse,
        "fritakfracaromreg": fritakfracaromreg,
        "omregnetavgift": omregnetavgift.toString(),
        "cargjeld": cargjeld,
        "hvagjeld": hvagjeld,
        "itemselger": itemselger,
        "startleiecar": startleiecar.toString(),
        "manedsbelopcar": manedsbelopcar.toString(),
        "gjenvarendekjoredistanse": gjenvarendekjoredistanse,
        "debitorskiftegebyrikr": debitorskiftegebyrikr,
        "avtalensutlopsdato": avtalensutlopsdato,
        "antallmonedertilavtalenutloper":
            antallmonedertilavtalenutloper.toString(),
        "leieselskap": leieselskap,
        "stedforlevering": stedforlevering,
        "cartype": cartype,
        "biltotalvekt": biltotalvekt.toString(),
        "biltotallengde": biltotallengde.toString(),
        "bilinnvendiglengde": bilinnvendiglengde.toString(),
        "bilbredde": bilbredde.toString(),
        "harbilentilstandsrapport": harbilentilstandsrapport,
        "harbilengaranti": harbilengaranti,
        "sengtype": sengtype,
        "carvedlikeholdsprogram": carvedlikeholdsprogram,
        "bilsoveplasser": bilsoveplasser.toString(),
        "kontaktperson": kontaktperson,
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

  getbmw(int userid) async {
    var response =
        await crud.postData(AppLink.carbmw, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getaudi(int userid) async {
    var response =
        await crud.postData(AppLink.caraudi, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  gettesla(int userid) async {
    var response =
        await crud.postData(AppLink.cartesla, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getmercedec(int userid) async {
    var response =
        await crud.postData(AppLink.carmercedec, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getVW(int userid) async {
    var response =
        await crud.postData(AppLink.carVW, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getporsche(int userid) async {
    var response =
        await crud.postData(AppLink.carporsche, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getvolvo(int userid) async {
    var response =
        await crud.postData(AppLink.carvolvo, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getford(int userid) async {
    var response =
        await crud.postData(AppLink.carford, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  gettoyota(int userid) async {
    var response =
        await crud.postData(AppLink.cartoyota, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getmazda(int userid) async {
    var response =
        await crud.postData(AppLink.carmazda, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
