import 'package:flutter/material.dart';
class Logo extends StatelessWidget {
  
  final double logosize;
  Logo({this.logosize});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: logosize,
      width: logosize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: new AssetImage("assets/Logo.png"),
          fit: BoxFit.cover,
        ),
      ),
      duration: Duration(milliseconds: 250),
    );
  }
}