import 'package:flutter/material.dart';
import 'SearchPages.dart';

class SearchAll extends StatefulWidget {
  String txt;
  SearchAll(this.txt);
  @override
  _SearchAllState createState() => _SearchAllState(txt);
}
class _SearchAllState extends State<SearchAll> {
  String txt;
_SearchAllState(this.txt);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
    
      duration: Duration(milliseconds: 15),
      child: containe(txt, 'Doctors, specialities, clinics',context) ,
    );
  }
}

