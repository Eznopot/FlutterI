import 'package:deezify/src/config/images.dart';
import 'package:flutter/material.dart';
import 'package:deezify/src/route/page_routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class navigationDrawer extends StatelessWidget {
  const navigationDrawer({Key? key}) : super(key: key);

  Widget drawerBodyItem({required IconData icon, required String text, required GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: [
          Icon(icon, size: 20.0,),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget createDrawerHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(DeezifyImages.menuHeaderBackground),
        )
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Welcome to Deezify",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              )
            )
          ),
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          createDrawerHeader(),
          drawerBodyItem(
            icon: FontAwesomeIcons.home,
            text: 'Home',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.home),
          ),
          drawerBodyItem(
            icon: FontAwesomeIcons.userAlt,
            text: 'Profile',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.login),
          ),
          drawerBodyItem(
            icon: FontAwesomeIcons.music,
            text: 'Music Playlist',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.musicList),
          ),
          Divider(),
        ],
      ),
    );
  }
}