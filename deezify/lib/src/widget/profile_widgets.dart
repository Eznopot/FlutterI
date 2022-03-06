import 'dart:io';
import 'package:deezify/src/config/images.dart';
import 'package:deezify/src/screen/take_picture/take_pictures_page.dart';
import 'package:flutter/material.dart';
import 'package:deezify/src/route/page_routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_cache_manager/my_cache_manager.dart';

class ProfileWidgets {
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

  Widget createProfileImage(double radius, String? imagePath) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: imagePath != null
        ? FileImage(File(imagePath))
        : const AssetImage(DeezifyImages.unknownProfileIcon) as ImageProvider,
    );
  }

  Widget responsiveHeaderBackgroundImage(String deviceType, Size size, Orientation? orientation) {
    if (deviceType == "Phone") {
      if (orientation == Orientation.portrait){
        return createHeaderBackgroundImage(size.height*0.35);
      } else {
        return createHeaderBackgroundImage(size.height*0.50);
      }
    } else {
      if (orientation == Orientation.portrait){
        return createHeaderBackgroundImage(size.height*0.35);
      } else {
        return createHeaderBackgroundImage(size.height*0.50);
      }
    }
  }

  Widget responsiveProfileImage(String deviceType, Size size, Orientation? orientation, String? imagePath) {
    if (deviceType == "Phone") {
      if (orientation == Orientation.portrait){
        return createProfileImage(size.height*0.20/2, imagePath);
      } else {
        return createProfileImage(size.height*0.30/2, imagePath);
      }
    } else {
      if (orientation == Orientation.portrait){
        return createProfileImage(size.height*0.20/2, imagePath);
      } else {
        return createProfileImage(size.height*0.30/2, imagePath);
      }
    }
  }

  Widget createProfileTopBody(
    double backgroundImageBottom,
    double profileImageTop,
    double cameraButtonRight,
    Color scaffoldBackgroundColor,
    String deviceType,
    Size size,
    Orientation orientation,
    String? imagePath,
    BuildContext context,
  ) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: backgroundImageBottom),
          child: responsiveHeaderBackgroundImage(deviceType, size, orientation),
        ),
        Positioned(
          top: profileImageTop,
          child: responsiveProfileImage(deviceType, size, orientation, imagePath),
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
                color: scaffoldBackgroundColor,
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
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TakePicturePage(),));
              },
            ),
          ),
        )
      ],
    );
  }

  Widget createLogOutButton(bool? isLogged, BuildContext context) {
    return  Center(
      child: ElevatedButton(
        child: Text(
          isLogged == true ? "Log out" : "Login",
          style: const TextStyle(fontSize: 18),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0),)
          )
        ),
        onPressed: () {
          MyCacheManager.writeBool("logged", false);
          MyCacheManager.writeString("loggedInfo", "");
          Navigator.of(context).popAndPushNamed(pageRoutes.login);
        },
      ),
    );
  }

  Widget createUserInfoText(String title, String? username, double usernameFontSize) {
    return Center(
      child: Text(
        title + username!,
        style: TextStyle(
          fontSize: usernameFontSize,
        ),
      ),
    );
  }

  Map<String, dynamic> getResponsiveValues(String deviceType, Orientation orientation, Size size) {
    Map<String, dynamic> result;

    if (deviceType == "Phone") {
      if (orientation == Orientation.portrait){
        return result = {
          "profileImageTop": size.height*0.35-size.height*0.20/2,
          "backgroundImageBottom": size.height*0.20/2,
          "cameraButtonRight": size.width*0.65/2,
          "usernameFontSize": 20.0,
        };
      } else {
        return result = {
          "profileImageTop": size.height*0.45-size.height*0.20/2,
          "backgroundImageBottom": size.height*0.25/2,
          "cameraButtonRight": size.width*0.82/2,
          "usernameFontSize": 20.0,
        };
      }
    } else {
      if (orientation == Orientation.portrait){
        return result = {
          "profileImageTop": size.height*0.40-size.height*0.30/2,
          "backgroundImageBottom": size.height*0.18/2,
          "cameraButtonRight": size.width*0.78/2,
          "usernameFontSize": 30.0,
        };
      } else {
        return result = {
          "profileImageTop": size.height*0.50-size.height*0.30/2,
          "backgroundImageBottom": size.height*0.25/2,
          "cameraButtonRight": size.width*0.83/2,
          "usernameFontSize": 30.0,
        };
      }
    }
  }
}