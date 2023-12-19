import 'package:dc_duhok/core/class/crud.dart';
import 'package:dc_duhok/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id, String userid) async {
    var response = await crud
        .postData(AppLink.items, {"id": id.toString(), "usersid": userid});
    return response.fold((l) => l, (r) => r);
  }

  getItemsImage(String id) async {
    var response =
        await crud.postData(AppLink.itemsImage, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
