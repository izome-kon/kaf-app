import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class BottomNavyBar extends StatelessWidget {
  final int selectedIndex;
  final double iconSize;
  final Color backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;

  BottomNavyBar(
      {Key key,
      this.selectedIndex = 0,
      this.showElevation = true,
      this.iconSize = 24,
      this.backgroundColor,
      this.animationDuration = const Duration(milliseconds: 270),
      @required this.items,
      @required this.onItemSelected}) {
    assert(onItemSelected != null);
  }

  Widget _buildItem(BottomNavyBarItem item, bool isSelected) {
    return AnimatedContainer(
      width: isSelected ? 85 : 55,
      height: double.maxFinite,
      duration: animationDuration,
      
      decoration: BoxDecoration(
        color:
            isSelected ? Colors.orangeAccent.withOpacity(0.15) : backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: ListView(
        padding: EdgeInsets.only(left: 8,right: 8),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          isSelected ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: IconTheme(
                  data: IconThemeData(
                      size: iconSize,
                      color: isSelected
                          ? item.activeColor.withOpacity(1)
                          : item.inactiveColor == null
                              ? item.activeColor
                              : item.inactiveColor),
                  child: item.selectedIcon,
                ),
              ),
              isSelected
                  ? DefaultTextStyle.merge(
                      style: TextStyle(
                          fontSize:10,
                          color: item.activeColor,
                          fontWeight: FontWeight.normal),
                      child: item.title,
                    )
                  : SizedBox.shrink()
            ],
          ):Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconTheme(
                data: IconThemeData(
                    size: iconSize,
                    color: isSelected
                        ? item.activeColor.withOpacity(1)
                        : item.inactiveColor == null
                            ? item.activeColor
                            : item.inactiveColor),
                child: item.icon,
              ),
              isSelected
                  ? DefaultTextStyle.merge(
                      style: TextStyle(
                          fontSize: 10,
                          color: item.inactiveColor,
                          fontWeight: FontWeight.normal),
                      child: item.title,
                    )
                  : DefaultTextStyle.merge(
                      style: TextStyle(
                          fontSize: 8,
                          color: item.inactiveColor,
                          fontWeight: FontWeight.normal),
                      child: item.title,
                    )
            ],
          )
        ],
      ),
    );
  }
int x=0;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            color: Color.fromRGBO(0, 0, 0, 0),
            boxShadow: [
              if (showElevation) BoxShadow(color: Colors.black12, blurRadius: 2)
            ]),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
               
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)),
              ),
              width: double.infinity,
              height: 60,
              padding: EdgeInsets.only(left: 15, top: 6, bottom: 6,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(  
                  children: items.getRange(0,2).map((item) {
                  var index = items.indexOf(item);
                  x+=1;
                  return GestureDetector(
                    onTap: () {
                      onItemSelected(index);
                    },
                    child:_buildItem(item, selectedIndex == index),
                  );
                }).toList(),),
                Row(children:items.getRange(2,4).map((item) {
                  var index = items.indexOf(item);
                  x+=1;
                  return GestureDetector(
                    onTap: () {
                      onItemSelected(index);
                    },
                    child:_buildItem(item, selectedIndex == index),
                  );
                }).toList(),),
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavyBarItem {
  final Image icon;
  final Image selectedIcon;
  final Text title;
  final Color activeColor;
  final Color inactiveColor;

  BottomNavyBarItem(
      {@required this.icon,
      @required this.title,
      this.selectedIcon,
      this.activeColor,
      this.inactiveColor}) {
    assert(icon != null);
    assert(title != null);
  }
}
