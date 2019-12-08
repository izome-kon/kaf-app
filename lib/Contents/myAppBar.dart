import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10))),
      child: Container(
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset("assets/Look@2x.png"),
            Column(
              children: <Widget>[
                Container(
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          color: Colors.white,
                        ),
                      ),
                    
                      Container(
                        padding: EdgeInsets.only(
                            top: 2, bottom: 2, right: 10, left: 10),
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              "Cairo",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
              Container(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Image.asset(
                              "assets/Logo.png",
                              width: 75,
                              height: 75,
                            )),
                      ),
          ],
        ),
      ),
    );
  }
}
