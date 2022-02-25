import 'package:deezify/src/screen/settings/settings_view.dart';
import 'package:flutter/material.dart';

import '../widgets/profile_image_widget.dart';

/// Displays 
class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);
  

  static const routeName = '/profile_page';

  @override
  Widget build(BuildContext context) {
    
    bool isScreenWide = MediaQuery.of(context).size.width >= 765;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
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
            const ProfileImageWidget(),
            ],
          )
        ),
    );
  }
}
