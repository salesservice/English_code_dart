import 'dart:io';

import '../../../core/classes/crud.dart';
import '../../sellx_link_api.dart';

class PropertyItemData {
  Crud crud;

  PropertyItemData(this.crud);

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
    String boligadkomst,
    String boligbeliggenhet,
    String boligtype,
    String boligeieform,
    String boligkommunenr,
    String boliggarsnummer,
    String boligbruksnummer,
    String boligseksjonsnr,
    String boligfestenummer,
    String leilighetsnummer,
    String boligbruksareal,
    String primaarrom,
    String flateareal,
    String boligarealbeskribelse,
    String boligbyggar,
    String boligrenovertar,
    String boligenergikarakter,
    String boligoppvarmingskarakter,
    String antallsoverom,
    String antallstuer,
    String antallrom,
    String boligetasje,
    String totaletasje,
    String borettslagetsnavn,
    String borettslagetseier,
    String borettslagetsorgnr,
    String borettslagetsandelnr,
    String tomtareal,
    String festeaar,
    String festeavgift,
    String felleskostnader,
    String felleskostnaderetteravdper,
    String felleskostnaderinkluderer,
    String formuesverdi,
    String boligomkostninger,
    String omkostningerinkluderer,
    String andelfellesgjeld,
    String verditakst,
    String lanelakst,
    String andelfellesformue,
    String kommunaleavgiftar,
    String eiendomsskattar,
    String forskjopsrett,
    String boligbeskrivelse,
    String boligtilleggsinfo,
    String boligvideolink,
    String boligurllink,
    String visningdato,
    String fraklokke,
    String tilklokke,
    String visningmerknad,
    String boligtelefon,
    String kontaktperson,
    String boliglokalomrade,
    String itemselger,
    String apentareal,
    String mobleringleie,
    String dyrtillat,
    String depositumleie,
    String inkludertileie,
    String leiesfra,
    String leiestil,
    String boligfasiliteter,
    String fasiliteterleie,
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
        "boligadkomst": boligadkomst,
        "boligbeliggenhet": boligbeliggenhet,
        "boligtype": boligtype,
        "boligeieform": boligeieform,
        "boligkommunenr": boligkommunenr.toString(),
        "boliggarsnummer": boliggarsnummer.toString(),
        "boligbruksnummer": boligbruksnummer.toString(),
        "boligseksjonsnr": boligseksjonsnr.toString(),
        "boligfestenummer": boligfestenummer.toString(),
        "leilighetsnummer": leilighetsnummer.toString(),
        "boligbruksareal": boligbruksareal.toString(),
        "primaarrom": primaarrom.toString(),
        "flateareal": flateareal.toString(),
        "boligarealbeskribelse": boligarealbeskribelse,
        "boligbyggar": boligbyggar.toString(),
        "boligrenovertar": boligrenovertar.toString(),
        "boligenergikarakter": boligenergikarakter,
        "boligoppvarmingskarakter": boligoppvarmingskarakter,
        "antallsoverom": antallsoverom.toString(),
        "antallstuer": antallstuer.toString(),
        "antallrom": antallrom.toString(),
        "boligetasje": boligetasje.toString(),
        "totaletasje": totaletasje.toString(),
        "borettslagetsnavn": borettslagetsnavn,
        "borettslagetseier": borettslagetseier,
        "borettslagetsorgnr": borettslagetsorgnr.toString(),
        "borettslagetsandelnr": borettslagetsandelnr.toString(),
        "tomtareal": tomtareal.toString(),
        "festeaar": festeaar.toString(),
        "festeavgift": festeavgift.toString(),
        "felleskostnader": felleskostnader.toString(),
        "felleskostnaderetteravdper": felleskostnaderetteravdper.toString(),
        "felleskostnaderinkluderer": felleskostnaderinkluderer.toString(),
        "formuesverdi": formuesverdi.toString(),
        "boligomkostninger": boligomkostninger.toString(),
        "omkostningerinkluderer": omkostningerinkluderer.toString(),
        "andelfellesgjeld": andelfellesgjeld.toString(),
        "verditakst": verditakst.toString(),
        "lanelakst": lanelakst.toString(),
        "andelfellesformue": andelfellesformue.toString(),
        "kommunaleavgiftar": kommunaleavgiftar.toString(),
        "eiendomsskattar": eiendomsskattar.toString(),
        "forskjopsrett": forskjopsrett,
        "boligbeskrivelse": boligbeskrivelse,
        "boligtilleggsinfo": boligtilleggsinfo,
        "boligvideolink": boligvideolink,
        "boligurllink": boligurllink,
        "visningdato": visningdato.toString(),
        "fraklokke": fraklokke.toString(),
        "tilklokke": tilklokke.toString(),
        "visningmerknad": visningmerknad,
        "boligtelefon": boligtelefon.toString(),
        "kontaktperson": kontaktperson,
        "boliglokalomrade": boliglokalomrade,
        "itemselger": itemselger,
        "apentareal": apentareal,
        "mobleringleie": mobleringleie,
        "dyrtillat": dyrtillat,
        "depositumleie": depositumleie.toString(),
        "inkludertileie": inkludertileie,
        "leiesfra": leiesfra,
        "leiestil": leiestil,
        "boligfasiliteter": boligfasiliteter,
        "fasiliteterleie": fasiliteterleie,

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

  getaksje(int userid) async {
    var response =
        await crud.postData(AppLink.aksje, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getboligtileie(int userid) async {
    var response =
        await crud.postData(AppLink.boligtileie, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getboligtilsalgs(int userid) async {
    var response = await crud
        .postData(AppLink.boligtilsalgs, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getenebolig(int userid) async {
    var response =
        await crud.postData(AppLink.enebolig, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getgarasje(int userid) async {
    var response =
        await crud.postData(AppLink.garasje, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getgardsbruk(int userid) async {
    var response =
        await crud.postData(AppLink.gardsbruk, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getleilighet(int userid) async {
    var response =
        await crud.postData(AppLink.leilighet, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getrekkehus(int userid) async {
    var response =
        await crud.postData(AppLink.rekkehus, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getselveier(int userid) async {
    var response =
        await crud.postData(AppLink.selveier, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  gettomannsbolig(int userid) async {
    var response = await crud
        .postData(AppLink.tomannsbolig, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
