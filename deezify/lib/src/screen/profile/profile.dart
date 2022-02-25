import 'dart:io';

import 'package:deezify/src/config/colors.dart';
import 'package:deezify/src/config/images.dart';
import 'package:deezify/src/navigationDrawer/navigation_drawer.dart';
import 'package:deezify/src/screen/take_picture/take_pictures_page.dart';
import 'package:deezify/src/utils/detect_device.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  final String? username;
  final String? imagePath;
  const Profile({ Key? key, this.username, this.imagePath }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


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
      backgroundImage: widget.imagePath != null
        ? FileImage(File(widget.imagePath!))
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
    double BackgroundImageBottom = 0.0;
    double cameraButtonRight = 0.0;
    double usernameFontSize = 0.0;
    final String? name = widget.username;
    
    if (deviceType == "Phone") {
      if (MediaQuery.of(context).orientation == Orientation.portrait){
        profileImageTop = size.height*0.35-size.height*0.20/2;
        BackgroundImageBottom = size.height*0.20/2;
        cameraButtonRight = size.width*0.65/2;
        usernameFontSize = 20;
      } else {
        profileImageTop = size.height*0.45-size.height*0.20/2;
        BackgroundImageBottom = size.height*0.25/2;
        cameraButtonRight = size.width*0.82/2;
        usernameFontSize = 20;
      }
    } else {
      if (MediaQuery.of(context).orientation == Orientation.portrait){
        profileImageTop = size.height*0.40-size.height*0.30/2;
        BackgroundImageBottom = size.height*0.18/2;
        cameraButtonRight = size.width*0.78/2;
        usernameFontSize = 30.0;
      } else {
        profileImageTop = size.height*0.50-size.height*0.30/2;
        BackgroundImageBottom = size.height*0.25/2;
        cameraButtonRight = size.width*0.83/2;
        usernameFontSize = 30.0;
      }
    }

    return Scaffold(
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
                margin: EdgeInsets.only(bottom: BackgroundImageBottom),
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
                    icon: Icon(
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
              name ?? "empty",
              style: TextStyle(
                fontSize: usernameFontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}