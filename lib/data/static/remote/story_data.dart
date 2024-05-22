import '../../../core/classes/crud.dart';
import '../../../sellx_link_api.dart';

class StoriData {
  Crud crud;

  StoriData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.story, {});
    return response.fold((l) => l, (r) => r);
  }
}
