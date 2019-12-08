import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  createStatus(
      {String imagePath: "assets/AppBar/Chinese_image.png",
      String name: "Chinese"}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  border: Border.all(color: Colors.white, width: 2)),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(imagePath),
              )),
          Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

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
                          icon:Icon(Icons.menu),
                          onPressed: (){Scaffold.of(context).openDrawer();},
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 50),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Image.asset(
                              "assets/Logo.png",
                              width: 75,
                              height: 75,
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 2, bottom: 2, right: 40, left: 10),
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
        ],
      ),
          ),
    );
  }
 
}


class SearchAppBar extends StatelessWidget {
  createStatus(
      {
        String imagePath: "assets/AppBar/Chinese_image.png",
      String name: "Chinese"}
      ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  border: Border.all(color: Colors.white, width: 2)),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(imagePath),
              )),
          Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

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
                          icon:Icon(Icons.menu),
                          onPressed: (){Scaffold.of(context).openDrawer();},
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 50),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Image.asset(
                              "assets/Logo.png",
                              width: 75,
                              height: 75,
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 2, bottom: 2, right: 40, left: 10),
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
        ],
      ),
          ),
    );
  }
 
}


