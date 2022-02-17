import 'package:flutter/material.dart';

/// Displays 
class HomePageCardView extends StatelessWidget {
  final String title;
  final String message;
  final String image;
  
  HomePageCardView(this.title, this.message, this.image);

  @override
  Widget build(BuildContext context) {
    
    return Center(
        child: Container(
          width: 300,
          height: 170,
          margin: const EdgeInsets.fromLTRB(40, 20, 40, 20),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  this.image
                ),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.srcATop),
            )
          ),
          child: Column(
            children: <Widget>[
              Text(
                this.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)

                ),
              ),
              Text(
                this.message,
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 255, 255, 255)
                ),
              )
            ],
          )
        )
      );
  }
}