import '../../../../core/classes/crud.dart';
import '../../../../sellx_link_api.dart';

class VerifycodeForgetpassordData {
  Crud crud;

  VerifycodeForgetpassordData(this.crud);

  postdata(
    String verifycode,
    String useremail,
  ) async {
    var response = await crud.postData(AppLink.forgetpassordverifycode, {
      "useremail": useremail,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
