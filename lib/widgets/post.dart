import 'package:flutter/material.dart';
import 'package:kaf/localizations.dart';
import 'package:kaf/models/post_model.dart';

class Post extends StatelessWidget {
  bool liked = false;
  final PostModel postModel;
  final String imgPaths = "http://Kaf.ideagroup-sa.com/storage/app/public/posts/";
  Post({this.postModel});
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
                                postModel.user.name,
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
                                    postModel.location,
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
                        postModel.text,
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
        Image.network("$imgPaths"+postModel.imageUrl,fit: BoxFit.cover,height: 250,width: MediaQuery.of(context).size.width,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[Icon(Icons.access_time), Text(postModel.time)],
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/Help");
              },
              child: Text(AppLocalizations.of(context).helpHimNow,style: TextStyle(color: Colors.red),),
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
