import 'package:deezify/src/composant/text_field_no_border.dart';
import 'package:deezify/src/model/arguments.dart';
import 'package:deezify/src/route/page_routes.dart';
import 'package:flutter/material.dart';

import '../screen/register/register_controller.dart';
import '../widget/custom_center.dart';
import '../widget/progress_button.dart';

class FormRegister extends StatefulWidget {
  FormRegister(
      {Key? key,
        required this.emailController,
        required this.passwordController,
        required this.usernameController,
        required this.buttonState,
        required this.controller})
      : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController usernameController;
  ButtonState buttonState;
  final RegisterController controller;

  @override
  State<FormRegister> createState() => _FormRegister();
}

class _FormRegister extends State<FormRegister> {
  void registerProcess() {
    setState(() {
      widget.buttonState = ButtonState.inProgress;
    });
    if (widget.emailController.text.isNotEmpty &&
        widget.passwordController.text.isNotEmpty &&
        widget.usernameController.text.isNotEmpty) {
      widget.controller
          .registerUser(
          widget.emailController.text,
          widget.passwordController.text,
          widget.usernameController.text)
          .then((value) {
        Future.delayed(const Duration(seconds: 1))
            .then((value) {
          setState(() {
            widget.buttonState = ButtonState.normal;
          });
          Navigator.of(context).pushNamed(
            pageRoutes.login,
            arguments: Arguments(
              widget.emailController.text,
              widget.usernameController.text,
            ),
          );
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
      child: Wrap(children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Center(
                child: TextFieldNoBorder(
                    passwordController: widget.emailController,
                    title: "Email",
                    description: "Enter your email",
                    isPassword: false),
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
                padding: const EdgeInsets.only(
                  top: 12,
                ),
                child: TextFieldNoBorder(
                    passwordController: widget.usernameController,
                    title: "Full name",
                    description: "Enter your full name"),
              ),
              CustomCenter(
                padding: const EdgeInsets.only(
                  top: 24,
                  left: 24,
                  right: 24,
                ),
                child: ProgressButton(
                    borderRadiusSize: 0,
                    buttonState: widget.buttonState,
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      registerProcess();
                    }),
              ),
              CustomCenter(
                padding: const EdgeInsets.only(
                  top: 6,
                ),
                child: TextButton(
                    child: const Text(
                      "Login",
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(pageRoutes.login);
                    }),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
