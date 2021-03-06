import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/colors.dart';
class NormalAppBar extends StatelessWidget {


final String title;
final GlobalKey<ScaffoldState> openDrawer;
NormalAppBar({this.title, this.openDrawer});
@override
Widget build(BuildContext context) {
  return Container(
    height: SizeConfig.screenWidth*s100,
    color: backgroundColor,
    child: Padding(
        padding:  EdgeInsets.only(top:SizeConfig.screenWidth*s50,left: SizeConfig.screenWidth*s14,
            right: SizeConfig.screenWidth*s14),
        child: Row(
          children: [
            Text(title,style: TextStyle(
                fontSize: SizeConfig.screenWidth*s17,
                color: Colors.white
            ),),


                InkWell(
                    onTap: openDrawer.currentState.openDrawer,
                    child: Icon(Icons.menu,color: Colors.white,size: SizeConfig.screenWidth*s35,)),



                Icon(Icons.arrow_back_ios_outlined,color: Colors.white,)

              ],
            ),



        )



  );
}
}
