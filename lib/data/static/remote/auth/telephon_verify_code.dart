import '../../../../core/classes/crud.dart';
import '../../../../sellx_link_api.dart';

class TelefonVerifyCode {
  Crud crud;

  TelefonVerifyCode(this.crud);

  postdata(String useremail, String verifycode) async {
    var response = await crud.postData(AppLink.senemailvericode, {
      "useremail": useremail,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
