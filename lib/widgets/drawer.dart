import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/userImageShape.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ween_arooh/utils/glopal_app.dart';
class AppDrawer extends StatefulWidget {

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context=context;
    return Drawer(
      child: Column(
        children: [
          drawerHeader(),
          SizedBox(height:SizeConfig.screenWidth*s40 ,),
          Expanded(
            child: ListView(children: [
              drawerShape(translator.translate('main'), 'ic_home','main'),
              drawerShape(translator.translate('record_service'), 'ic_record_service','add_activity'),
              drawerShape(translator.translate('call_us'), 'call','call'),
              drawerShape(translator.translate('language'), 'ic_lang','lang'),
              drawerShape(translator.translate('information'), 'ic_person','setting'),
              drawerShape(translator.translate('logout'), 'ic_logout','login'),
            ],),
          )
         


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
                Text(GlopalApp.user.name??"",style: TextStyle(
                  fontSize: SizeConfig.screenWidth*s17
                ),)
              ],
            )),
          ),
        ),
        InkWell(
          onTap: ()=>Navigator.pushNamed(context, '/login'),
          child: Padding(
            padding:  EdgeInsets.only(top: SizeConfig.screenWidth*s35,right:SizeConfig.screenWidth*s10,left: SizeConfig.screenWidth*s10 ),
            child: Align(
              alignment: Alignment.topRight,
              child: Text("دخول",style: TextStyle(
                fontSize: SizeConfig.screenWidth*s18,
                fontWeight: FontWeight.bold,

                decoration: TextDecoration.underline,
              ),),
            ),
          ),
        )
      ],
    );
  }

  drawerShape(String title,String imagePath,route){
    return GestureDetector(
        onTap: () => _route(route),

      child: Padding(
        padding:  EdgeInsets.only(bottom:SizeConfig.screenWidth*s30),
        child: ListTile(
          title: Text(title,style: TextStyle(
            fontSize: SizeConfig.screenWidth*s17
          ),),
          leading:    SvgPicture.asset(

          "assets/images/$imagePath.svg",color: route=="call"?Colors.grey:null,),

        ),
      ),
    );
  }

  _changeLanguage() {
    translator.setNewLanguage(
      context,
      newLanguage: translator.currentLanguage == 'ar' ? 'en' : 'ar',
      remember: true,
      restart: true,
    );

    setState(() {
      print('lang change');
    });
    // widget._changeScreen();
    Navigator.pop(context);
  }
  _route(String name) {
    if (name == 'lang') {
      _changeLanguage();
    } else if (name == "add_activity") {
      Navigator.pop(context);
      Navigator.pushNamed(_context, '/add_activity');
    } else if (name == "setting") {
      Navigator.pop(context);
      Navigator.pushNamed(_context, '/setting');
    } else if (name == "login") {
      Navigator.pop(context);
      Navigator.pushNamed(_context, '/login');
    } else if (name == "main") {
      Navigator.pop(context);
      Navigator.pushNamed(_context, '/main');

    }
    else if (name == "call") {
      Navigator.pop(context);
      Navigator.pushNamed(_context, '/chat');

    }else {
      Navigator.pop(context);
//      navigateAndKeepStack(context, Home());
    }
  }
}
