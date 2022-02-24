
import 'dart:io';

import 'package:flutter/cupertino.dart';

class RoundImage extends StatelessWidget {
  const RoundImage({
    Key? key,
    required this.width,
    required this.height,
    required this.imageString,
    required this.cached,
  }) : super(key: key);
  final double width;
  final double height;
  final String imageString;
  final bool cached;


  @override
  Widget build(BuildContext context) {
    return cached == true ?
    Container(
      width: width,
      height: height,
      child: Image.file(File(imageString)),
      decoration: const BoxDecoration(
        shape: BoxShape.circle, //File(imagePath)
      ),
    )
        :
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle, //File(imagePath)
        image: DecorationImage(
            image: AssetImage(imageString),
            fit: BoxFit.fill
        ),
      ),
    );
  }
}