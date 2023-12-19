import 'package:dc_duhok/core/class/crud.dart';
import 'package:dc_duhok/linkapi.dart';

class RatingData {
  Crud crud;
  RatingData(this.crud);
  sendData(String id, String rating, String comment) async {
    var response = await crud.postData(AppLink.rating, {
      'id': id,
      'rating': rating,
      'comment': comment,
    });
    return response.fold((l) => l, (r) => r);
  }
}
