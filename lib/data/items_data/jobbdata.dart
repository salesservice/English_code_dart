import 'dart:io';

import '../../../core/classes/crud.dart';
import '../../sellx_link_api.dart';

class JobbAnnonseData {
  Crud crud;

  JobbAnnonseData(this.crud);

  addData(
    int userid,
    int katid,
    String itemaktiv,
    String itembeskrivelse,
    String itemname,
    String itemtistand,
    String itemland,
    String itempostn,
    String itemby,
    String itemgata,
    String itemtelefon,
    String jobbdelheltid,
    String jobbfirma,
    String jobbstillingtitel,
    String jobbfrist,
    String jobbansettelsesform,
    String jobbsektor,
    String jobbhjemmekontor,
    String jobbbransje,
    String jobbstillingsfunksjon,
    String jobbbeskrivelse,
    String arbeidsprak,
    String jobbomarbeidsgiver,
    String jobbsted,
    String jobbkontaktperson,
    String jobbtelefonkontaktpers,
    String stillingkontaktperon1,
    String jobbantllstillinger,
    String jobbhjemmeside,
    String kontaktperson,
    String stillingkontaktperon2,
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
        "itemtistand": itemtistand,
        "itemland": itemland,
        "itempostn": itempostn,
        "itemby": itemby,
        "itemgata": itemgata,
        "itemtelefon": itemtelefon,
        "jobbdelheltid": jobbdelheltid,
        "jobbfirma": jobbfirma,
        "jobbstillingtitel": jobbstillingtitel,
        "jobbfrist": jobbfrist,
        "jobbansettelsesform": jobbansettelsesform,
        "jobbsektor": jobbsektor,
        "jobbhjemmekontor": jobbhjemmekontor,
        "jobbbransje": jobbbransje,
        "jobbstillingsfunksjon": jobbstillingsfunksjon,
        "jobbbeskrivelse": jobbbeskrivelse,
        "arbeidsprak": arbeidsprak,
        "jobbomarbeidsgiver": jobbomarbeidsgiver,
        "jobbsted": jobbsted,
        "jobbkontaktperson": jobbkontaktperson,
        "jobbtelefonkontaktpers": jobbtelefonkontaktpers,
        "stillingkontaktperon1": stillingkontaktperon1,
        "jobbantllstillinger": jobbantllstillinger,
        "jobbhjemmeside": jobbhjemmeside,
        "kontaktperson": kontaktperson,
        "stillingkontaktperon2": stillingkontaktperon2,
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

  getheltid(int userid) async {
    var response =
        await crud.postData(AppLink.heltid, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getdeltid(int userid) async {
    var response =
        await crud.postData(AppLink.deltid, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
