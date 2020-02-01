import 'package:flutter/material.dart';

class BloodButton extends StatefulWidget {
 String blood;
  BloodButton(this.blood);
  @override
  _BloodButtonState createState() => _BloodButtonState(blood);
}

class _BloodButtonState extends State<BloodButton> {
    String blood;
    bool cheked ;
   _BloodButtonState(String blood){
    this.blood=blood;
  }
  @override
  void initState() {
    // TODO: implement initState
    cheked = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          cheked = !cheked;
        });
      },
        
          child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 2, color: Theme.of(context).primaryColor)),
        child: CircleAvatar(
          
          child: Text(
            blood,
            style: TextStyle(color:cheked? Colors.white: Theme.of(context).primaryColor),
          ),
          backgroundColor: cheked? Theme.of(context).primaryColor: Colors.white,
        ),
      ),
    );
  }
}

