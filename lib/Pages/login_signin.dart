import 'package:flutter/material.dart';
import 'package:kaf/widgets/LoginTab.dart';
import 'package:kaf/widgets/SignUpTab.dart';
import 'package:kaf/widgets/TxtField.dart';

class log_sign extends StatefulWidget {
  int index;
  log_sign(this.index);
  @override
  _log_signState createState() => _log_signState(index);
}

double tabheight = 600;

class _log_signState extends State<log_sign>
    with SingleTickerProviderStateMixin {
    int _index;
      _log_signState(this._index);
  TabController tabController;
  Widget cardtype;
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor.withOpacity(0.6),
             
          ),
          Image.asset("assets/BGLogInState@2x.png"),
          Center(
                child: AnimatedSwitcher(
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(child: child, scale: animation);
                    },
                    duration: Duration(microseconds: 450),
                    child: cardtype = choose_card(_index))),
        ],
      ),
    );
  }

  Widget choose_card(int x) {
    if (x == 1)
      return SingleChildScrollView(child: LoginTab(
        onPressed: (){
          setState(() {
            _index=2;
          });
        },
      ));
    else
      return SingleChildScrollView(child: SignUpTab(onPressed: (){
        setState(() {
          _index =1;
        });
      },));
  }
}
