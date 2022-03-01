import 'dart:convert';

import 'package:deezify/src/model/user_model.dart';
import 'package:deezify/src/utils/secure_storage.dart';
import 'package:my_cache_manager/my_cache_manager.dart';

class LoginService {
  SecureStorage secureStorage = SecureStorage();

  Future<bool> loginUser(String email, String password) async {
    List<String>? list = await MyCacheManager.readStringList("user");
    if (list != null) {
      for (String elem in list) {
        UserModel tmp = UserModel.fromJson(jsonDecode(elem));
        if (tmp.getEmail() == email && tmp.getPassword() == password) {
          await MyCacheManager.writeString("loggedInfo", jsonEncode(tmp));
          await MyCacheManager.writeBool("logged", true);
          secureStorage.writeSecureData("logged", "true");
          return true;
        } else {
          await MyCacheManager.writeBool("logged", false);
        }
      }
    }
    return false;
  }
}
