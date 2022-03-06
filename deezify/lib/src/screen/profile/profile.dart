import 'dart:convert';
import 'package:deezify/src/config/colors.dart';
import 'package:deezify/src/navigationDrawer/navigation_drawer.dart';
import 'package:deezify/src/route/page_routes.dart';
import 'package:deezify/src/utils/detect_device.dart';
import 'package:deezify/src/utils/secure_storage.dart';
import 'package:deezify/src/widget/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:my_cache_manager/my_cache_manager.dart';
import '../../model/user_model.dart';

class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? imagePath;
  String? username;
  String? email;
  bool? isLogged;
  double profileImageTop = 0.0;
  double backgroundImageBottom = 0.0;
  double cameraButtonRight = 0.0;
  double usernameFontSize = 0.0;
  ProfileWidgets profileWidgets = ProfileWidgets();
  final SecureStorage secureStorage = SecureStorage();

  @override
  void initState() {
    super.initState();
    MyCacheManager.readBool("logged").then((logged) {
      isLogged = logged;
      if (logged == true) {
        MyCacheManager.readString("loggedInfo").then((info) {
          if (info != null) {
            setState(() {
              username = UserModel.fromJson(jsonDecode(info)).getUsername();
              email = UserModel.fromJson(jsonDecode(info)).getEmail();
            });
          }
        });
        secureStorage.readSecureData("profileImage").then((value) {
          setState(() => imagePath = value);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String deviceType = detectDevice.getDeviceType();
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    Color scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    Map<String, dynamic> rvalue = profileWidgets.getResponsiveValues(deviceType, orientation, size);

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: DeezifyColors.appBarBackgound,
          elevation: 0,
          title: Text("Profile".toUpperCase(), style: const TextStyle(color: Colors.white),),
        ),
        drawer: const navigationDrawer(),
        body: ListView(
          children: [
            profileWidgets.createProfileTopBody(
              rvalue["backgroundImageBottom"],
              rvalue["profileImageTop"],
              rvalue["cameraButtonRight"],
              scaffoldBackgroundColor,
              deviceType,
              size, orientation, imagePath,
              context,
            ),
            SizedBox(height: size.height*0.10,),
            profileWidgets.createUserInfoText("Username :", isLogged == true && username != null ? username! : "Guest", rvalue["usernameFontSize"]),
            profileWidgets.createUserInfoText("Email :", isLogged == true && email != null ? email! : "", rvalue["usernameFontSize"]),
            SizedBox(height: size.height*0.10,),
            profileWidgets.createLogOutButton(isLogged, context),
          ],
        ),
      ),
      onWillPop: () async {
        Navigator.popAndPushNamed(context, pageRoutes.home);
        return true;
      },
    );
  }
}