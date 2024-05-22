import '../../../../core/classes/crud.dart';
import '../../../../sellx_link_api.dart';

class SjekkEmailForgetpassordData {
  Crud crud;

  SjekkEmailForgetpassordData(this.crud);

  postdata(
    String useremail,
  ) async {
    var response = await crud.postData(AppLink.sjekkemailforgetpassord, {
      "useremail": useremail,
    });
    return response.fold((l) => l, (r) => r);
  }
}
