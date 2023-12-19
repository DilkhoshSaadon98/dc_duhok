import 'package:dc_duhok/core/class/crud.dart';
import 'package:dc_duhok/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(String firstname, String lastname, String password,
      String email, String phone) async {
    var response = await crud.postData(AppLink.signUp, {
      'firstname': firstname,
      'lastname': lastname,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }

  updateData(String email, String firstname, String lastname,
      String phone) async {
    var response = await crud.postData(AppLink.updateUser, {
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
