import 'package:dc_duhok/core/class/crud.dart';
import 'package:dc_duhok/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata(String email, String password) async {
    var response = await crud
        .postData(AppLink.login, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }

  getUser(String email) async {
    var response = await crud.postData(AppLink.getUser, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
