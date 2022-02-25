import 'package:deezify/src/composant/text_field_no_border.dart';
import 'package:deezify/src/model/arguments.dart';
import 'package:deezify/src/route/page_routes.dart';
import 'package:flutter/material.dart';

import '../screen/login/login_controller.dart';
import '../widget/custom_center.dart';
import '../widget/progress_button.dart';

class FormLogin extends StatefulWidget {

  FormLogin(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.username,
      required this.buttonState,
      required this.controller})
      : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String? username;
  ButtonState buttonState;
  final LoginController controller;

  @override
  State<FormLogin> createState() => _FormLogin();
}

class _FormLogin extends State<FormLogin> {
  void loginProcess() {
    if (widget.emailController.text.isNotEmpty &&
        widget.passwordController.text.isNotEmpty) {
      widget.controller
          .loginUser(
              widget.emailController.text, widget.passwordController.text)
          .then((value) {
        setState(() {
          widget.buttonState = ButtonState.inProgress;
        });
        setState(() {
          if (widget.controller.logged) {
            widget.buttonState = ButtonState.normal;
            Navigator.of(context).pushNamed(
              pageRoutes.profile,
              arguments: Arguments(
                widget.emailController.text,
                widget.username,
              ),
            );
          } else {
            widget.buttonState = ButtonState.error;
          }
        });
      });
    } else {
      setState(() {
        widget.buttonState = ButtonState.error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Wrap(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Center(
                  child: TextFieldNoBorder(
                      passwordController: widget.emailController,
                      title: "Email",
                      description: "Enter your email"),
                ),
                CustomCenter(
                  padding: const EdgeInsets.only(
                    top: 12,
                  ),
                  child: TextFieldNoBorder(
                      passwordController: widget.passwordController,
                      title: "Password",
                      description: "Enter your password",
                      isPassword: true),
                ),
                CustomCenter(
                  padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                  child: ProgressButton(
                      buttonState: widget.buttonState,
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        loginProcess();
                      }),
                ),
                CustomCenter(
                  padding: const EdgeInsets.only(
                    top: 6,
                  ),
                  child: TextButton(
                      child: const Text(
                        "Sign up",
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(pageRoutes.register);
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
