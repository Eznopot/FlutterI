import 'package:deezify/src/config/colors.dart';
import 'package:deezify/src/navigationDrawer/navigation_drawer.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String? username;
  const Profile({ Key? key, this.username }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DeezifyColors.appBarBackgound,
        elevation: 0,
        title: Text("Profile".toUpperCase(), style: TextStyle(color: Colors.white),),
      ),
      drawer: navigationDrawer(),
      body: Column(
        children: [
          Text(widget.username ?? "empty"),
        ],
      ),
    );
  }
}