import 'dart:io';

import 'package:deezify/src/login/login_service.dart';
import 'package:flutter/material.dart';

import '../composant/form_login.dart';
import '../widget/progress_button.dart';
import 'login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key, this.email}) : super(key: key);

  static const routeName = '/login';
  final String? email;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  late final LoginController controller;

  ButtonState buttonState = ButtonState.normal;

  @override
  void initState() {
    super.initState();
    if (widget.email != null) {
      emailController.text = widget.email!;
    }
    controller = LoginController(LoginService());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.1, horizontal: size.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                  child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/icon/DeezifyLogo.png"),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )),
            ),
            FormLogin(emailController: emailController, passwordController: passwordController, buttonState: buttonState, controller: controller),
          ],
        ),
      ),
    );
  }
}
