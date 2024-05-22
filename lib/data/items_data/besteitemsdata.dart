import '../../../core/classes/crud.dart';
import '../../sellx_link_api.dart';

class BesteitemsCarData {
  Crud crud;

  BesteitemsCarData(this.crud);

  getbesteitemscar(int userid) async {
    var response = await crud
        .postData(AppLink.bestitemscar, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getbesteitemsbolig(int userid) async {
    var response = await crud
        .postData(AppLink.bestitemsbolig, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getbesteitemsboat(int userid) async {
    var response = await crud
        .postData(AppLink.bestitemsboat, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getbesteitemsmc(int userid) async {
    var response =
        await crud.postData(AppLink.bestitemsmc, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getbesteitemssykler(int userid) async {
    var response = await crud
        .postData(AppLink.bestitemssykler, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getbesteitemsjobb(int userid) async {
    var response = await crud
        .postData(AppLink.bestitemsjobb, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getbesteitemsboker(int userid) async {
    var response = await crud
        .postData(AppLink.bestitemsboker, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getbesteitemsmobler(int userid) async {
    var response = await crud
        .postData(AppLink.bestitemsmobler, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getbesteitemselektronikk(int userid) async {
    var response = await crud
        .postData(AppLink.bestitemselektronikk, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getbesteitemsklar(int userid) async {
    var response = await crud
        .postData(AppLink.bestitemsklar, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getbesteallitems(int userid) async {
    var response = await crud
        .postData(AppLink.bestallitems, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
