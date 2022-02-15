
import 'dart:io';

import 'package:flutter/material.dart';

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
  late final RegisterController controller;
  final TextEditingController passwordController = TextEditingController();

  ButtonState buttonState = ButtonState.normal;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
              flex: 4,
              child: Wrap(children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Center(
                        child: CustomTextField(
                          labelText: "Email",
                          hintText: "Enter your username",
                          controller: usernameController,
                        ),
                      ),
                      CustomCenter(
                        padding: const EdgeInsets.only(
                          top: 12,
                        ),
                        child: CustomTextField(
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
                          isPassword: true,
                          labelText: "Full name",
                          hintText: "Enter your Fullname",
                          controller: passwordController,
                        ),
                      ),
                      CustomCenter(
                        padding: const EdgeInsets.only(
                          top: 12,
                        ),
                        child: ProgressButton(
                            buttonState: buttonState,
                            child: const Text(
                              "Sign up",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {}),
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
