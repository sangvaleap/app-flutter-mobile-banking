import 'package:banking_app/theme/colors.dart';
import 'package:flutter/material.dart';

class ActionBox extends StatelessWidget {
  ActionBox({ Key? key, required this.title, required this.icon, this.color, this.bgColor }) : super(key: key);
  IconData icon;
  Color? color;
  Color? bgColor;
  String title;

  @override
  Widget build(BuildContext context) {
    return  
      Container(
        // width: double.infinity,
        height: 130,
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: this.bgColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: secondary
              ),
              child: Icon(icon, size: 28, color: color,)
            ),
            SizedBox(height: 13),
            Text(title, style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w600),)
          ],
        ) 
      );
  }
}
