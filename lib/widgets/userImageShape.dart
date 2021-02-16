import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
class UserImageShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
     "assets/images/user.png" ,
      scale: 0.8,
      width: SizeConfig.screenWidth * 0.25,
      height: SizeConfig.screenWidth * 0.25,
      fit: BoxFit.fill,
    );
  }
}
