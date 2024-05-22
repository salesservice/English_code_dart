import '../../../../core/classes/crud.dart';
import '../../../../sellx_link_api.dart';

class RegistrerData {
  Crud crud;

  RegistrerData(this.crud);

  postdata(String userfname, String userphone, String useremail,
      String userpassword, String userbpassord) async {
    var response = await crud.postData(AppLink.registreremail, {
      "userfname": userfname,
      "userphone": userphone,
      "useremail": useremail,
      "userpassword": userpassword,
      "userbpassord": userbpassord,
    });
    return response.fold((l) => l, (r) => r);
  }
}
