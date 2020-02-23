import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kaf/widgets/Logo.dart';

class Load extends StatefulWidget {
  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {
  @override
  Widget build(BuildContext context) {
    Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/DrawerBG.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            Center(
                child: Logo(
              logosize: 200,
            )),
            Center(
              child: SpinKitPulse(
                color: Colors.white,
                size: 200.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
