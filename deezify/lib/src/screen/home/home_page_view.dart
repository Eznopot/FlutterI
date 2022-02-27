import 'package:deezify/src/config/colors.dart';
import 'package:deezify/src/config/images.dart';
import 'package:deezify/src/navigationDrawer/navigation_drawer.dart';
import 'package:deezify/src/route/page_routes.dart';
import 'package:flutter/material.dart';

import '../../widget/home_page_card.dart';
import '../../widget/home_page_logo.dart';

/// Displays 
class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    bool isScreenWide = MediaQuery.of(context).size.width >= 765;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: DeezifyColors.appBarBackgound,
        actions:  <Widget>[
          IconButton(
            onPressed: () {
              Navigator.restorablePushNamed(context, pageRoutes.profile);
            },
            icon: Image.asset(DeezifyImages.unknownProfileIcon),
            iconSize: 50,
          )
        ],
      ),
      drawer: navigationDrawer(),
      body: SingleChildScrollView(
        child: Center(
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
                      DeezifyImages.listeningMusic,
                    ),
                    HomePageCardView(
                      "Une utilisation facile à prendre en main\n",
                      "Deezify s'est concentré à avoir un site simple, intuitifs et agréable visuellement afin de facilité son utilisation.", 
                      DeezifyImages.designApp,
                    ),
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
