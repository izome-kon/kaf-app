import 'package:flutter/material.dart';
import 'package:kaf/widgets/LoginTab.dart';
import 'package:kaf/widgets/SignUpTab.dart';

class LogSign extends StatefulWidget {
  final int index;
  LogSign(this.index);
  @override
  _LogSignState createState() => _LogSignState(index);
}

double tabheight = 600;

class _LogSignState extends State<LogSign>
    with SingleTickerProviderStateMixin {
    int _index;
      _LogSignState(this._index);
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
                    child: cardtype = chooseCard(_index))),
        ],
      ),
    );
  }

  Widget chooseCard(int x) {
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
