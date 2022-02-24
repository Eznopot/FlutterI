import 'dart:convert';

import 'package:deezify/src/model/user_model.dart';
import 'package:my_cache_manager/my_cache_manager.dart';

class LoginService {
  Future<bool> loginUser(String email, String password) async {
    List<String>? list = await MyCacheManager.readStringList("user");
    if (list != null) {
      for (String elem in list) {
        UserModel tmp = UserModel.fromJson(jsonDecode(elem));
        if (tmp.getEmail() == email && tmp.getPassword() == password) {
          return true;
        }
      }
    }
    return false;
  }
}
