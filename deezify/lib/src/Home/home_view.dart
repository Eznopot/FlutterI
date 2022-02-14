import 'package:flutter/material.dart';

import '../widget/custom_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String routeName = "/";

  @override
  State<HomeView> createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text("Welcome to Deezify",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
