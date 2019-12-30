import 'package:flutter/material.dart';

class TxtFeild extends StatelessWidget {
  final String txt;
  final Icon icon;
  final bool obscure;
  final TextEditingController controller;
  TxtFeild({this.txt,this.icon,this.obscure,this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Material(
        elevation: 5.0,
        shadowColor: Colors.black,
        borderRadius: BorderRadius.circular(25.0),
        child: TextFormField(
          
          obscureText: obscure,
          autofocus: false,
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusColor: Color.fromRGBO(117, 219, 160, 1),
              hintText: txt,
              suffixIcon: icon,
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(10.0),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.white, width: 0)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.white, width: 0))),
        ),
      ),
    );
  }
}
