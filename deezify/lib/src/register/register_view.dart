
import 'dart:io';

import 'package:deezify/src/register/register_service.dart';
import 'package:flutter/material.dart';

import '../login/login_view.dart';
import '../widget/custom_center.dart';
import '../widget/custom_text_field.dart';
import '../widget/progress_button.dart';
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

  @override void initState() {
    super.initState();
    controller = RegisterController(RegisterService());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.1, horizontal: size.width * 0.1),
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
                            fit: BoxFit.contain
                        ),
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
            Expanded(
              flex: 2,
              child: Wrap(children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Center(
                        child: CustomTextField(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                          ),
                          labelText: "Email",
                          hintText: "Enter your username",
                          controller: emailController,
                        ),
                      ),
                      CustomCenter(
                        padding: const EdgeInsets.only(
                          top: 12,
                        ),
                        child: CustomTextField(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                          ),
                          isPassword: true,
                          labelText: "Password",
                          hintText: "Enter your password",
                          controller: passwordController,
                        ),
                      ),
                      CustomCenter(
                        padding: const EdgeInsets.only(
                          top: 12,
                        ),
                        child: CustomTextField(
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(0)),
                          ),
                          isPassword: false,
                          labelText: "Full name",
                          hintText: "Enter your Fullname",
                          controller: usernameController,
                        ),
                      ),
                      CustomCenter(
                        padding: const EdgeInsets.only(
                          top: 24, left: 24, right: 24,
                        ),
                        child: ProgressButton(
                            borderRadiusSize: 0,
                            buttonState: buttonState,
                            child: const Text(
                              "Sign up",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              setState(() {
                                buttonState = ButtonState.inProgress;
                              });
                              if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty && usernameController.text.isNotEmpty) {
                                controller.registerUser(emailController.text, passwordController.text, usernameController.text).then((value) {
                                  Future.delayed(const Duration(seconds: 1)).then((value) {
                                    setState(() {
                                      buttonState = ButtonState.normal;
                                    });
                                    Navigator.of(context).pushNamed(LoginView.routeName, arguments: emailController.text);
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
                              "Login",
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(LoginView.routeName);
                            }),
                      ),
                    ],
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
