import 'dart:io';

import 'package:deezify/src/config/colors.dart';
import 'package:deezify/src/config/images.dart';
import 'package:deezify/src/navigationDrawer/navigation_drawer.dart';
import 'package:deezify/src/route/page_routes.dart';
import 'package:deezify/src/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:my_cache_manager/my_cache_manager.dart';

import '../../widget/home_page_card.dart';
import '../../widget/home_page_logo.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({ Key? key }) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final SecureStorage secureStorage = SecureStorage();
  String? imagePath;
  bool? isLogged;
  String titleCard1 = "Une qualité de son garantie\n";
  String titleCard2 = "Une utilisation facile à prendre en main\n";
  String textCard1 = "Deezify, avec sa technologie avancée de traitement de son, trie dans sa base de donnée les musiques qui répondent au demande exigente de qualité sonnore que Deezify à défini.";
  String textCard2 = "Deezify s'est concentré à avoir un site simple, intuitifs et agréable visuellement afin de facilité son utilisation.";

  @override
  void initState() {
    super.initState();
    secureStorage.readSecureData("profileImage").then((value) {
      setState(() {
        imagePath = value;
      });
    });
    MyCacheManager.readBool("logged").then((value) {
      setState(() {
        isLogged = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 765;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: DeezifyColors.appBarBackgound,
        actions:  <Widget>[
          GestureDetector(
            onTap: () {
              isLogged == true
              ? Navigator.popAndPushNamed(context, pageRoutes.profile)
              : Navigator.popAndPushNamed(context, pageRoutes.login);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                backgroundImage: imagePath != null && isLogged == true
                  ? FileImage(File(imagePath!))
                  : const AssetImage(DeezifyImages.unknownProfileIcon) as ImageProvider,
              ),
            ),
          ),
        ],
      ),
      drawer: const navigationDrawer(),
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
                      titleCard1,
                      textCard1, 
                      DeezifyImages.listeningMusic,
                    ),
                    HomePageCardView(
                      titleCard2,
                      textCard2, 
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