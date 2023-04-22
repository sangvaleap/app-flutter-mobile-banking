import 'package:flutter/material.dart';

import 'avatar_image.dart';

class UserBox extends StatelessWidget {
  const UserBox({
    Key? key,
    required this.user,
    this.isSVG = false,
    this.width = 55,
    this.height = 55,
  }) : super(key: key);

  final user;
  final double width;
  final double height;
  final bool isSVG;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AvatarImage(
          user["image"],
          isSVG: isSVG,
          width: width,
          height: height,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          user["fname"],
          style: TextStyle(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
