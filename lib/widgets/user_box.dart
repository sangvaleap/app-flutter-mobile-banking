
import 'package:flutter/material.dart';

import 'avatar_image.dart';

class UserBox extends StatelessWidget {
  UserBox({ Key? key, required this.user, this.isSVG = false, this.width = 55, this.height = 55}) : super(key: key);
  final user;
  double width;
  double height;
  bool isSVG;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AvatarImage(user["image"],
          isSVG: isSVG, width: width, height: height,
        ),
        SizedBox(height: 8,),
        Text(user["fname"], style: TextStyle(fontWeight: FontWeight.w500),)
      ],
    );
  }
}