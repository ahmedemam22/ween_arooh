import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/colors.dart';

class MainCategoryShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset("assets/images/markets.png",color: categoryColor,
          width: SizeConfig.screenWidth*s43,
          height: SizeConfig.screenWidth*s38,),
          SizedBox(height:SizeConfig.screenWidth*s5),

          Text("اسواق",style: TextStyle(
            fontSize: SizeConfig.screenWidth*s15,
            color: categoryColor
          ),)
        ],
      ),
    );
  }
}
