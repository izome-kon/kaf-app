import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(7),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              child: Image.asset("assets/comment.png"),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Mahmoud Mohamed",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 15),
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    size: 15,
                                  ),
                                  Text(
                                    "  Riyadh",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 10),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.share),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              liked? Icons.star:Icons.star_border,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "I need a blood donation",
                        style:
                        TextStyle(color: Theme.of(context).primaryColor),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Image.asset("assets/blood.png"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[Icon(Icons.access_time), Text("6m ago")],
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/Help");
              },
              child: Text("help him now",style: TextStyle(color: Colors.red),),
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),side: BorderSide(color: Colors.red)),
            )
          ],
        )
      ],
    );
  }
}
