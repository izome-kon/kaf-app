import 'package:flutter/material.dart';

class HelpUser extends StatefulWidget {
  @override
  _HelpUserState createState() => _HelpUserState();
}

class _HelpUserState extends State<HelpUser> {
  @override
  final TextEditingController control = new TextEditingController(text: "I need Blood");
  final TextEditingController control2 = new TextEditingController(text: "1 / 1/ 1999");
  final TextEditingController control3 = new TextEditingController(text: "Kareem Hejab");

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.90),
      body:CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Theme.of(context).primaryColor,
            pinned: true,
            expandedHeight: 250,
            elevation: 20,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    "assets/BGLogInState@2x.png",
                    fit: BoxFit.cover,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
 Container(
              
              width: MediaQuery.of(context).size.width*0.95,
              child: Column(

                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    child: Image.asset("assets/Doctor.png"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  width: 2,
                                  color: Theme.of(context).primaryColor.withOpacity(0.3))),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.share,color: Colors.white,),
                          )),
                      Column(
                        children: <Widget>[
                          Text("Mahmoud Mohamed",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20)),
                          Text("+966015505886",style: TextStyle(color: Colors.white),),
                        ],
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  width: 2,
                                  color: Theme.of(context).primaryColor.withOpacity(0.3))),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.star_border,color: Colors.white,),
                          )
                      )
                    ],
                  )
                ],
              ),
            ),
                  ],)
                 
                ],
              ),
              title: Text("Help Mahmoud"),
              centerTitle: true,

            ),

          ),
          SliverFillRemaining(
            child: 
            ListView(
              padding: EdgeInsets.only(right: 10,left: 10),
          shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children:<Widget>[
               Container(
               padding: EdgeInsets.only(left:10,right: 10),
               width: MediaQuery.of(context).size.width * 0.9,
               height: MediaQuery.of(context).size.height * 0.50,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(20),
               ),
               child:
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   new TextField(
                     maxLines: 5,

                     decoration: InputDecoration(
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(30.0),

                         ),
                         labelText: "Discription",
                         enabled: false,
                 
                         alignLabelWithHint: true,
                         filled: true,
                         fillColor: Colors.white),
                     style: new TextStyle(color: Colors.black),
                     controller: control,
                   ),
                   Row(
                     children: <Widget>[
                       Icon(Icons.location_on,color: Theme.of(context).accentColor,),
                       Text("Jeddah,92/9 ,Almalek Khaled street")
                     ],
                   ),
                   Container(
                     child: Image.asset("assets/Map.png"),
                   ),
                 ],
               ),
             ),
        Divider(),
        Container(
           padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(

               color: Colors.white,
               borderRadius: BorderRadius.circular(30),
             ),
             child: Column(
               children: <Widget>[
                 Container(
                   alignment: Alignment.center,
                
                   height: MediaQuery.of(context).size.height * 0.05,
                   decoration: BoxDecoration(
                     color: Theme.of(context).primaryColor,
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                   ),
                   child: Text("Donar information",style: TextStyle(color: Colors.white,fontSize: 20),),
                 ),
                 Container(
                   padding: EdgeInsets.only(top: 15),
                   width: MediaQuery.of(context).size.width*0.8,
                   child: new TextField(

                     decoration: InputDecoration(
                       suffixIcon: Icon(Icons.person),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(30.0),
                         ),
                         labelText: "Full Name",
                         enabled: false,
                         filled: true,
                         fillColor: Colors.white),
                     style: new TextStyle(color: Colors.black),
                     controller: control3,
                   ),
                 ),
                 Container(
                   padding: EdgeInsets.only(top: 5),
                   width: MediaQuery.of(context).size.width*0.8,
                   child: new TextField(

                     decoration: InputDecoration(
                         suffixIcon: Icon(Icons.date_range),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(30.0),
                         ),
                         labelText: "Birthday Date",
                         enabled: false,
                         filled: true,
                         fillColor: Colors.white),
                     style: new TextStyle(color: Colors.black),
                     controller: control2,
                   ),
                 ),
                 Container(
                   padding: EdgeInsets.only(top: 5),
                   height: 35,
                   width: 150,
                   child: RaisedButton(
                     onPressed: () {},
                     child: Text("Done",style: TextStyle(color: Colors.white),),
                     color: Colors.red,
                     elevation: 0,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                   ),
                 )
               ],
             ),
        )
            ],),
          )
        ],
      ),
    );
  }
}
