import 'package:flutter/material.dart';

import '../screen/settings/settings_view.dart';


/// Displays 
class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({Key? key}) : super(key: key);
  static const username = 'username1';
  
  @override
  Widget build(BuildContext context) {
    

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: IconButton(
                onPressed: () {
                  Navigator.restorablePushNamed(context, SettingsView.routeName); // A rajouter le route pour modifier l'image profile
                },
                icon: Image.asset('images/Profile.png'),
                iconSize: 200,
              )
          ),
          const Text(
            username,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            
          )
        ],
      ),
    );
  }
}
