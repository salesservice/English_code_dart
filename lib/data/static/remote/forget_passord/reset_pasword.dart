import '../../../../core/classes/crud.dart';
import '../../../../sellx_link_api.dart';

class ResetpassordData {
  Crud crud;

  ResetpassordData(this.crud);

  postdata(
    String userpassword,
    String userbpassord,
    String useremail,
  ) async {
    var response = await crud.postData(AppLink.resetpassord, {
      "userpassword": userpassword,
      "userbpassord": userbpassord,
      "useremail": useremail,
    });
    return response.fold((l) => l, (r) => r);
  }
}
