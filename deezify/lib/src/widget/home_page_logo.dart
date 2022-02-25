import 'package:deezify/src/config/images.dart';
import 'package:flutter/material.dart';


/// Displays 
class HomePageLogo extends StatelessWidget {
  const HomePageLogo({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Image(
            image: AssetImage(DeezifyImages.logo),
            height: 200,
          ),
          const Text(
            "Bienvenue sur Deezify.\nEcouter de la musique vient de devenir plus simple.",
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
