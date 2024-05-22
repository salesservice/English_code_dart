import '../../../../core/classes/crud.dart';
import '../../../../sellx_link_api.dart';

class EmailVerifyCode {
  Crud crud;

  EmailVerifyCode(this.crud);

  postdata(String useremail, String verifycode) async {
    var response = await crud.postData(AppLink.senemailvericode, {
      "useremail": useremail,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendData(String useremail) async {
    var response = await crud.postData(AppLink.resendverifycode, {
      "useremail": useremail,
    });
    return response.fold((l) => l, (r) => r);
  }
}
