import 'package:deezify/src/Home/home_view.dart';
import 'package:flutter/material.dart';

import '../register/register_view.dart';
import '../take_picture/take_pictures_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case HomeView.routeName:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RegisterView.routeName:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case TakePicturePage.routeName:
        return MaterialPageRoute(builder: (_) => TakePicturePage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
            title: const Text("Error")
        ),
        body: const Center(
          child: Text("ERROR in navigation"),
        ),
      );
    });
  }
}