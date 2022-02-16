import 'dart:convert';

import 'package:deezify/src/model/user_model.dart';
import 'package:my_cache_manager/my_cache_manager.dart';

class RegisterService {
  Future<void> registerUser(String email, String password, String username) async {
    UserModel user = UserModel(email, password, username, "", "");
    List<String>? list = await MyCacheManager.readStringList("user");
    if (list != null) {
      list.add(jsonEncode(user.toJson()));
    } else {
      list = [jsonEncode(user.toJson())];
    }
    await MyCacheManager.writeStringList("user", list);
  }
}
