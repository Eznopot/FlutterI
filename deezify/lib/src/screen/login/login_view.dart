import 'package:deezify/src/config/colors.dart';
import 'package:deezify/src/config/images.dart';
import 'package:deezify/src/navigationDrawer/navigation_drawer.dart';
import 'package:deezify/src/screen/login/login_service.dart';
import 'package:flutter/material.dart';
import '../../composant/form_login.dart';
import '../../widget/progress_button.dart';
import 'login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key, this.email, this.username}) : super(key: key);

  final String? email;
  final String? username;

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
      appBar: AppBar(
        backgroundColor: DeezifyColors.appBarBackgound,
        elevation: 0,
        title: Text(
          "Login".toUpperCase(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      drawer: const navigationDrawer(),
      backgroundColor: DeezifyColors.loginBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.1, horizontal: size.width * 0.1),
          child: SizedBox(
            height: size.height,
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
                                image:
                                    AssetImage(DeezifyImages.logo),
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
                FormLogin(
                  emailController: emailController,
                  passwordController: passwordController,
                  buttonState: buttonState,
                  controller: controller,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
