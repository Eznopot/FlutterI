import 'package:flutter/material.dart';

import 'register_service.dart';

class RegisterController with ChangeNotifier {
  RegisterController(this._settingsService);

  final RegisterService _settingsService;
}
