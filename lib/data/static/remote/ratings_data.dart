import '../../../core/classes/crud.dart';
import '../../../sellx_link_api.dart';

class RatingData {
  Crud crud;

  RatingData(this.crud);

  ratingData(
    int userid,
    double rating,
    String comment,
  ) async {
    var response = await crud.postData(AppLink.rating, {
      "userid": userid.toString(),
      "rating": rating.toString(),
      "comment": comment.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
