import 'package:flutter/material.dart';


class DrawerButton extends StatelessWidget {

  final String name;
  final IconData icon;
  final VoidCallback onPressed;
  DrawerButton({
    this.name,
    this.icon,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
                      onPressed: onPressed,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(icon,color: Colors.white,),
                              Text("  $name",style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          Icon(Icons.keyboard_arrow_right,color: Colors.white,)
                        ],
                      ),
                    );
  }
}