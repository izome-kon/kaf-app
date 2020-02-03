import 'package:flutter/material.dart';
import 'package:kaf/models/user_model.dart';
import 'package:kaf/sql/sqlHelper.dart';

class EditProfile extends StatefulWidget {
  final User user;
  EditProfile(this.user);
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User user;
  TextEditingController fullNameControl;
  TextEditingController birthDayControl;
  TextEditingController nINControl;
  TextEditingController userNameControl;
  TextEditingController emailControl;
  TextEditingController passwordControl;
  TextEditingController phoneControl;
  @override
  void initState() {
    user = widget.user;
    fullNameControl = new TextEditingController(text: user.name);
    birthDayControl = new TextEditingController(text: user.birthdate);
    nINControl = new TextEditingController(text: user.naID.toString());
    userNameControl = TextEditingController(text: user.email);
    emailControl = TextEditingController(text: user.email);
    passwordControl = TextEditingController();
    phoneControl = TextEditingController(text: user.phone);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Text(
                              "Edit Profile",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                    ),
                                    color: Colors.white,
                                  ),
                                  button("Log Out", 350)
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              infoBoxes("   Full Name", Icons.person, fullNameControl),
              infoBoxes("   National Identification Number", Icons.person_pin,
                  nINControl),
              infoBoxes("   Date of Birth", Icons.date_range, birthDayControl),
              infoBoxes("   User Name", Icons.person, userNameControl),
              infoBoxes("   Email", Icons.email, emailControl),
              infoBoxes("   Change Your Password", Icons.lock_outline,
                  passwordControl),
              infoBoxes("   Phone Number", Icons.phone, phoneControl),
              button("Save", 200),
            ],
          ),
        ),
      ),
    );
  }

  Material infoBoxes(String general, IconData icon, controler) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Container(
          width: MediaQuery.of(context).size.width - 80,
          height: 50,
          child: new TextField(
            decoration: InputDecoration(
                suffixIcon: Icon(icon),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 20),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                labelText: general,
                filled: true,
                fillColor: Colors.white),
            style: new TextStyle(color: Colors.black),
            controller: controler,
          ),
        ),
      ),
    );
  }

  ButtonTheme button(String text, int width) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width - width,
      height: 30,
      child: RaisedButton(
        onPressed: () {
          SqlHelper.logOut();
          Navigator.pushReplacementNamed(context, '/login');
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        color: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
