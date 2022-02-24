import 'package:flutter/material.dart';

import 'register_service.dart';

class RegisterController with ChangeNotifier {
  RegisterController(this._registerService);

  final RegisterService _registerService;

  Future<void> registerUser(String email, String password, String username) async {
    await _registerService.registerUser(email, password, username);
    notifyListeners();
  }
}
