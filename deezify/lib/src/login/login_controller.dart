import 'package:flutter/material.dart';

import 'login_service.dart';

class LoginController with ChangeNotifier {
  LoginController(this._registerService);

  final LoginService _registerService;

  bool _logged = false;

  bool get logged => _logged;

  Future<void> loginUser(String email, String password) async {
    _logged = await _registerService.registerUser(email, password);
    notifyListeners();
  }
}
