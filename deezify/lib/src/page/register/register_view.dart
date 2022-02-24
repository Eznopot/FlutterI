import 'dart:io';

import 'package:deezify/src/page/register/register_service.dart';
import 'package:flutter/material.dart';
import '../../composant/form_register.dart';
import '../../widget/progress_button.dart';
import 'register_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  static const routeName = '/register';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  late final RegisterController controller;

  ButtonState buttonState = ButtonState.normal;

  @override
  void initState() {
    super.initState();
    controller = RegisterController(RegisterService());
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
                        "Sign up",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )),
            ),
            FormRegister(emailController: emailController, passwordController: passwordController, usernameController: usernameController, buttonState: buttonState, controller: controller)
          ],
        ),
      ),
    );
  }
}