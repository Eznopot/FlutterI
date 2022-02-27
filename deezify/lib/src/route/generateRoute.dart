import 'package:deezify/src/screen/home/home_page_view.dart';
import 'package:deezify/src/model/arguments.dart';
import 'package:deezify/src/screen/music/music_list.dart';
import 'package:deezify/src/route/page_routes.dart';
import 'package:deezify/src/screen/profile/profile.dart';
import 'package:deezify/src/screen/register/register_view.dart';
import 'package:deezify/src/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import '../screen/login/login_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    final SecureStorage secureStorage = SecureStorage();
    String? email;
    
    switch (settings.name) {
      case pageRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePageView());
      case pageRoutes.musicList:
        return MaterialPageRoute(builder: (_) => MusicListPage());
      case pageRoutes.login:
        if (settings.arguments != null) {
          final args = settings.arguments as Arguments;
          return MaterialPageRoute(builder: (_) => LoginView(email: args.email,));
        }
        return MaterialPageRoute(builder: (_) => const LoginView());
      case pageRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case pageRoutes.profile:
        return MaterialPageRoute(builder: (_) => Container(
          child: FutureBuilder(
            future: secureStorage.readSecureData("email"),
            builder:  (context, snapshot) {
              email = snapshot.data.toString();
              if (email == null) {
                return LoginView();
              } else {
                return Profile();
              }
            },
          ),
        ));
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