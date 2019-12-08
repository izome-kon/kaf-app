import 'package:flutter/material.dart';
import 'package:kaf/localizations.dart';
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
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: <Widget>[
      AnimatedContainer(
        duration: Duration(milliseconds: 15),
        child: containe(txt, AppLocalizations.of(context).doctorsAnd,context) ,
      ),
    ],);
  }
}

