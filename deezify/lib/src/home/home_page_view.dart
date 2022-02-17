import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import './home_page_card.dart';
import './home_page_logo.dart';

/// Displays 
class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);
  

  static const routeName = '/home_page';

  @override
  Widget build(BuildContext context) {
    
    bool isScreenWide = MediaQuery.of(context).size.width >= 765;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions:  <Widget>[
          IconButton(
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
            icon: Image.asset('images/Profile.png'),
            iconSize: 50,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const HomePageLogo(),
            Center(
              child: Flex(
              direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomePageCardView(
                      "Une qualité de son garantie\n",
                      "Deezify, avec sa technologie avancée de traitement de son, trie dans sa base de donnée les musiques qui répondent au demande exigente de qualité sonnore que Deezify à défini.", 
                      "images/Listening_to_Music.jpg"
                    ),
                    HomePageCardView(
                      "Une utilisation facile à prendre en main\n",
                      "Deezify s'est concentré à avoir un site simple, intuitifs et agréable visuellement afin de facilité son utilisation.", 
                      "images/Design_App.jpg"
                    ),
                  ],
                ),
              )
            ],
          )
        ),
    );
  }
}
