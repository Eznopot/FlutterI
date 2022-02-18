import 'dart:io';

import 'package:deezify/src/login/login_service.dart';
import 'package:flutter/material.dart';

import '../composant/TextFieldNoBorder.dart';
import '../register/register_view.dart';
import '../widget/custom_center.dart';
import '../widget/custom_text_field.dart';
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
            Expanded(
              flex: 2,
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Center(
                          child: TextFieldNoBorder(
                              passwordController: passwordController,
                              title: "Email",
                              description: "Enter your email"),
                        ),
                        CustomCenter(
                          padding: const EdgeInsets.only(
                            top: 12,
                          ),
                          child: TextFieldNoBorder(
                              passwordController: passwordController,
                              title: "Password",
                              description: "Enter your password",
                              isPassword: true),
                        ),
                        CustomCenter(
                          padding: const EdgeInsets.only(
                              top: 24, left: 24, right: 24),
                          child: ProgressButton(
                              buttonState: buttonState,
                              child: const Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                if (emailController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty) {
                                  controller
                                      .loginUser(emailController.text,
                                          passwordController.text)
                                      .then((value) {
                                    setState(() {
                                      buttonState = ButtonState.inProgress;
                                    });
                                    setState(() {
                                      if (controller.logged) {
                                        buttonState = ButtonState.normal;
                                      } else {
                                        buttonState = ButtonState.error;
                                      }
                                    });
                                  });
                                } else {
                                  setState(() {
                                    buttonState = ButtonState.error;
                                  });
                                }
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
                                Navigator.of(context)
                                    .pushNamed(RegisterView.routeName);
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
