import 'package:deezify/src/Home/home_view.dart';
import 'package:deezify/src/screen/music_list.dart';
import 'package:deezify/src/route/page_routes.dart';
import 'package:flutter/material.dart';

import '../screen/login/login_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case pageRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case pageRoutes.musicList:
        return MaterialPageRoute(builder: (_) => const MusicListPage());
      case LoginView.routeName:
        if (args is String) {
          return MaterialPageRoute(builder: (_) => LoginView(email: args,));
        }
        return MaterialPageRoute(builder: (_) => const LoginView());
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