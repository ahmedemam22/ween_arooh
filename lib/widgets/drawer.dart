import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/userImageShape.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter_svg/flutter_svg.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          drawerHeader(),
          SizedBox(height:SizeConfig.screenWidth*s40 ,),
          drawerShape(translator.translate('main'), 'ic_home'),
          drawerShape(translator.translate('record_service'), 'ic_record_service'),
          drawerShape(translator.translate('call_us'), 'call'),
          drawerShape(translator.translate('language'), 'ic_lang'),
          drawerShape(translator.translate('information'), 'ic_person'),
          drawerShape(translator.translate('logout'), 'ic_logout'),


        ],
      ),
    );
  }
  drawerHeader(){
    return Stack(
      children: [
        Container(
          color: drawerColor,
          height: SizeConfig.screenWidth*s200,
          child: Padding(
            padding:  EdgeInsets.only(top:SizeConfig.screenWidth*s50),
            child: Center(child: Column(
              children: [
                UserImageShape(path:'assets/images/userDrawer.png'),
                SizedBox(height: SizeConfig.screenWidth*s10,),
                Text("mohamed jamal",style: TextStyle(
                  fontSize: SizeConfig.screenWidth*s17
                ),)
              ],
            )),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(top: SizeConfig.screenWidth*s35,right:SizeConfig.screenWidth*s10,left: SizeConfig.screenWidth*s10 ),
          child: Align(
            alignment: Alignment.topRight,
            child: Text("دخول",style: TextStyle(
              fontSize: SizeConfig.screenWidth*s18,
              fontWeight: FontWeight.bold,

              decoration: TextDecoration.underline,
            ),),
          ),
        )
      ],
    );
  }
  drawerShape(String title,String imagePath){
    return Padding(
      padding:  EdgeInsets.only(bottom:SizeConfig.screenWidth*s30),
      child: ListTile(
        title: Text(title,style: TextStyle(
          fontSize: SizeConfig.screenWidth*s17
        ),),
        leading:    SvgPicture.asset(

        "assets/images/$imagePath.svg"),

      ),
    );
  }
}
