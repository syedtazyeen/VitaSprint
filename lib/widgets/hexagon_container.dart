import 'dart:math';

import 'package:flutter/material.dart';

class HexagonContainer extends StatelessWidget {

  String text;

  HexagonContainer({super.key, required this.text});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 64.0, // Set the desired width and height
        height: 56.0,
        margin: EdgeInsets.all(8),
        child: ClipPath(
          clipper: HexagonClipper(),
          child: Container(
            color: Color(0xffFFF38C), // Set the background color of the hexagon
            child: Center(
              child: Text(
                text,
                style: TextStyle(// Set the text color
                  fontSize: 16.0, // Set the text size
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final height = size.height;
    final width = size.width;

    path.moveTo(0, height / 2);
    path.lineTo(width / 4, 0);
    path.lineTo((3 * width) / 4, 0);
    path.lineTo(width, height / 2);
    path.lineTo((3 * width) / 4, height);
    path.lineTo(width / 4, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}