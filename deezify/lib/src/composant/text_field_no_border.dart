import 'package:flutter/material.dart';

import '../widget/custom_text_field.dart';

class TextFieldNoBorder extends StatelessWidget {
  const TextFieldNoBorder({
    Key? key,
    required this.passwordController,
    required this.title,
    required this.description,
    this.isPassword
  }) : super(key: key);

  final TextEditingController passwordController;
  final String title;
  final String description;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      inputBorder: InputBorder.none,
      color: Colors.white,
      isPassword: isPassword ?? false,
      labelText: title,
      hintText: description,
      controller: passwordController,
    );
  }
}