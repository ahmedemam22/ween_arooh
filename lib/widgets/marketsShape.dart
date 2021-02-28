import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
class MarketsShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/images/markets_demo.png',fit: BoxFit.fill,
      width: SizeConfig.screenWidth*s130,height: SizeConfig.screenWidth*s130,)

    );
  }
}
