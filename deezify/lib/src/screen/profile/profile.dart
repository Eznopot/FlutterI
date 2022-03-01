import 'dart:convert';
import 'dart:io';

import 'package:deezify/src/config/colors.dart';
import 'package:deezify/src/config/images.dart';
import 'package:deezify/src/navigationDrawer/navigation_drawer.dart';
import 'package:deezify/src/route/page_routes.dart';
import 'package:deezify/src/screen/take_picture/take_pictures_page.dart';
import 'package:deezify/src/utils/detect_device.dart';
import 'package:deezify/src/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  bool? isLogged;
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
              username = UserModel.fromJson(jsonDecode(info)).getEmail();
            });
          }
        });
        secureStorage.readSecureData("profileImage").then((value) {
          setState(() {
            imagePath = value;
          });
        });
      }
    });
  }

  Widget createHeaderBackgroundImage(double height) {
    return Container(
      color: Colors.grey,
      child: Image.asset(
        DeezifyImages.profileHeader,
        width: double.infinity,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget createProfileImage(double radius) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: imagePath != null
        ? FileImage(File(imagePath!))
        : AssetImage(DeezifyImages.unknownProfileIcon) as ImageProvider,
    );
  }

  Widget responsiveHeaderBackgroundImage(String deviceType, Size size) {
    if (deviceType == "Phone") {
      if (MediaQuery.of(context).orientation == Orientation.portrait){
        return createHeaderBackgroundImage(size.height*0.35);
      } else {
        return createHeaderBackgroundImage(size.height*0.50);
      }
    } else {
      if (MediaQuery.of(context).orientation == Orientation.portrait){
        return createHeaderBackgroundImage(size.height*0.35);
      } else {
        return createHeaderBackgroundImage(size.height*0.50);
      }
    }
  }

  Widget responsiveProfileImage(String deviceType, Size size) {
    if (deviceType == "Phone") {
      if (MediaQuery.of(context).orientation == Orientation.portrait){
        return createProfileImage(size.height*0.20/2);
      } else {
        return createProfileImage(size.height*0.30/2);
      }
    } else {
      if (MediaQuery.of(context).orientation == Orientation.portrait){
        return createProfileImage(size.height*0.20/2);
      } else {
        return createProfileImage(size.height*0.30/2);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String deviceType = detectDevice.getDeviceType();
    Size size = MediaQuery.of(context).size;
    double profileImageTop = 0.0;
    double backgroundImageBottom = 0.0;
    double cameraButtonRight = 0.0;
    double usernameFontSize = 0.0;
    
    if (deviceType == "Phone") {
      if (MediaQuery.of(context).orientation == Orientation.portrait){
        profileImageTop = size.height*0.35-size.height*0.20/2;
        backgroundImageBottom = size.height*0.20/2;
        cameraButtonRight = size.width*0.65/2;
        usernameFontSize = 20;
      } else {
        profileImageTop = size.height*0.45-size.height*0.20/2;
        backgroundImageBottom = size.height*0.25/2;
        cameraButtonRight = size.width*0.82/2;
        usernameFontSize = 20;
      }
    } else {
      if (MediaQuery.of(context).orientation == Orientation.portrait){
        profileImageTop = size.height*0.40-size.height*0.30/2;
        backgroundImageBottom = size.height*0.18/2;
        cameraButtonRight = size.width*0.78/2;
        usernameFontSize = 30.0;
      } else {
        profileImageTop = size.height*0.50-size.height*0.30/2;
        backgroundImageBottom = size.height*0.25/2;
        cameraButtonRight = size.width*0.83/2;
        usernameFontSize = 30.0;
      }
    }

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: DeezifyColors.appBarBackgound,
          elevation: 0,
          title: Text("Profile".toUpperCase(), style: TextStyle(color: Colors.white),),
        ),
        drawer: navigationDrawer(),
        body: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: backgroundImageBottom),
                  child: responsiveHeaderBackgroundImage(deviceType, size),
                ),
                Positioned(
                  top: profileImageTop,
                  child: responsiveProfileImage(deviceType, size),
                ),
                Positioned(
                  bottom: 0.0,
                  right: cameraButtonRight,
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 4.0,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      color: Colors.greenAccent,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        FontAwesomeIcons.camera,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => TakePicturePage(),),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height*0.10,),
            Center(
              child: Text(
                isLogged == true && username != null ? username! : "Guest",
                style: TextStyle(
                  fontSize: usernameFontSize,
                ),
              ),
            ),
            SizedBox(height: size.height*0.10,),
            Center(
              child: ElevatedButton(
                child: Text(
                  isLogged == true ? "Log out" : "Login",
                  style: const TextStyle(fontSize: 18),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )
                  )
                ),
                onPressed: () {
                  MyCacheManager.writeBool("logged", false);
                  secureStorage.writeSecureData("logged", "false");
                  MyCacheManager.writeString("loggedInfo", "");
                  Navigator.of(context).popAndPushNamed(pageRoutes.login);
                },
              ),
            ),
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