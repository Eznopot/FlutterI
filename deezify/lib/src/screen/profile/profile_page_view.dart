import 'package:deezify/src/config/images.dart';
import 'package:deezify/src/route/page_routes.dart';
import 'package:deezify/src/screen/settings/settings_view.dart';
import 'package:flutter/material.dart';

import '../../widget/profile_image_widget.dart';

/// Displays 
class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    bool isScreenWide = MediaQuery.of(context).size.width >= 765;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        actions:  <Widget>[
          IconButton(
            onPressed: () {
              Navigator.restorablePushNamed(context, pageRoutes.setting);
            },
            icon: Image.asset(DeezifyImages.unknownProfileIcon),
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
