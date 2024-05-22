import '../../../core/classes/crud.dart';
import '../../../sellx_link_api.dart';

class NotificationData {
  Crud crud;

  NotificationData(this.crud);

  getData(int userid) async {
    var response = await crud
        .postData(AppLink.notificationview, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(int notiid) async {
    var response = await crud
        .postData(AppLink.deletenotification, {"notiid": notiid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
