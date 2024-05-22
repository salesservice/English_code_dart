import 'dart:io';

import '../../../core/classes/crud.dart';
import '../../sellx_link_api.dart';

class MotorcycleItemData {
  Crud crud;

  MotorcycleItemData(this.crud);

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
    String mctype,
    String mcregnummer,
    String mcchassisnr,
    String mcmodellar,
    String mcmerke,
    String mcmodell,
    String motorsykkeltype,
    String mcslagvolumiccm,
    String mchk,
    String mcdrivstoff,
    String mcvektkg,
    String mcfarge,
    String mcutstyr,
    String mckilometerstand,
    String mcantalleiere,
    String mctilstandsrappoet,
    String mcvelikeholdsprogram,
    String mcgjenvarendegarantimnd,
    String mcgjenvarendegarantikm,
    String mcvideo,
    String mcbeskrivelse,
    String mcomregavgift,
    String mcomregfritak,
    String mcparkerti,
    String itemselger,
    String kontaktperson,
    String startleiecar,
    String manedsbelopcar,
    String gjenvarendekjoredistanse,
    String debitorskiftegebyrikr,
    String avtalensutlopsdato,
    String antallmonedertilavtalenutloper,
    String leieselskap,
    String stedforlevering,
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
        "mctype": mctype,
        "mcregnummer": mcregnummer,
        "mcchassisnr": mcchassisnr,
        "mcmodellar": mcmodellar,
        "mcmerke": mcmerke,
        "mcmodell": mcmodell,
        "motorsykkeltype": motorsykkeltype,
        "mcslagvolumiccm": mcslagvolumiccm,
        "mchk": mchk,
        "mcdrivstoff": mcdrivstoff,
        "mcvektkg": mcvektkg,
        "mcfarge": mcfarge,
        "mcutstyr": mcutstyr,
        "mckilometerstand": mckilometerstand,
        "mcantalleiere": mcantalleiere,
        "mctilstandsrappoet": mctilstandsrappoet,
        "mcvelikeholdsprogram": mcvelikeholdsprogram,
        "mcgjenvarendegarantimnd": mcgjenvarendegarantimnd,
        "mcgjenvarendegarantikm": mcgjenvarendegarantikm,
        "mcvideo": mcvideo,
        "mcbeskrivelse": mcbeskrivelse,
        "mcomregavgift": mcomregavgift,
        "mcomregfritak": mcomregfritak,
        "mcparkerti": mcparkerti,
        "itemselger": itemselger,
        "kontaktperson": kontaktperson,
        "startleiecar": startleiecar.toString(),
        "manedsbelopcar": manedsbelopcar.toString(),
        "gjenvarendekjoredistanse": gjenvarendekjoredistanse,
        "debitorskiftegebyrikr": debitorskiftegebyrikr,
        "avtalensutlopsdato": avtalensutlopsdato,
        "antallmonedertilavtalenutloper":
            antallmonedertilavtalenutloper.toString(),
        "leieselskap": leieselskap,
        "stedforlevering": stedforlevering,
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

  getmotosykler(int userid) async {
    var response =
        await crud.postData(AppLink.motorsykkel, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getmoped(int userid) async {
    var response =
        await crud.postData(AppLink.moped, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getsnoscooter(int userid) async {
    var response =
        await crud.postData(AppLink.snoscooter, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getatv(int userid) async {
    var response =
        await crud.postData(AppLink.atv, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
