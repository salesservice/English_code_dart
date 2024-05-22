import '../../../../core/classes/crud.dart';
import '../../../../sellx_link_api.dart';

class LogginnData {
  Crud crud;

  LogginnData(this.crud);

  postdata(
    String useremail,
    String userpassword,
  ) async {
    var response = await crud.postData(AppLink.logginn, {
      "useremail": useremail,
      "userpassword": userpassword,
    });
    return response.fold((l) => l, (r) => r);
  }
}
