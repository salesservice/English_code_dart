import 'dart:io';

import '../../../core/classes/crud.dart';
import '../../../sellx_link_api.dart';

class EditDeleteItemData {
  Crud crud;

  EditDeleteItemData(this.crud);
  getItems(int userid) async {
    var response =
        await crud.postData(AppLink.viewannonse, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  deleteItems(Map data) async {
    var response = await crud.postData(AppLink.deleteannonse, data);
    return response.fold((l) => l, (r) => r);
  }

  editItems(Map data, [File? file]) async {
    // var response;
    // if (file == null) {
    //   response = await crud.postData(AppLink.editannonse, data);
    // } else {
    //   response =
    //       await crud.addRequestWithImageOne(AppLink.editannonse, data, file);
    // }
    // return response.fold((l) => l, (r) => r);
  }
}
