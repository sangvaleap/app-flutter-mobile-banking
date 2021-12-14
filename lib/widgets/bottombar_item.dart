import 'package:banking_app/theme/colors.dart';
import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem(this.icon, this.title, {this.onTap, this.color = inActiveIcon, this.activeColor = primary, this.isActive = false, this.isNotified = false});
  final IconData icon;
  final String title;
  final Color color;
  final Color activeColor;
  final bool isNotified;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
              children: [
                isNotified ?
                new Stack(
                  children: <Widget>[
                    new Icon(icon, size: 26, color: isActive ? activeColor : activeColor.withOpacity(.4),),
                    new Positioned( 
                      top: 5.0,
                      right: 0,
                      left: 8.0,
                      child: 
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: new Icon(Icons.brightness_1, size: 10.0, color: Colors.red),
                        ),
                    )
                  ]
                ) 
                :
                new Icon(icon, size: 26, color: isActive ? activeColor : activeColor.withOpacity(.4),),
                Text(title, style: TextStyle(fontSize: 10, color: isActive ? activeColor : activeColor.withOpacity(.5))),
              ],
            ),
    );  
  }
}