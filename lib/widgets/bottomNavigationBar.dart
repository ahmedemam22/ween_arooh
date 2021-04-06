import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/homeProvider.dart';
import 'package:ween_arooh/utils/glopal_app.dart';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
class BottomnavigationBar extends StatefulWidget {
  @override
  _BottomnavigationBarState createState() => _BottomnavigationBarState();
}

class _BottomnavigationBarState extends State<BottomnavigationBar> {
  int _index=1;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (context, add, child) {
          return BottomNavigationBar(
            onTap: (index) {
              setState(() {
                if(index==0&&GlopalApp.user==null)
                  Dialogs().awsomeDialogWithCancel(context: context,type: DialogType.ERROR,title: translator.translate('sorry'),
                      desc: translator.translate('valid_login'),onClick: ()=>Navigator.pushNamed(context, '/login') );
            else{    _index = index;
                Provider.of<HomeProvider>(context, listen: false).changeIndex(
                    index);
                Navigator.pushReplacementNamed(context, '/main',arguments: _index);}
              });
            },
            currentIndex: add.index, // this will be set when a new tab is tapped
            items: [

              BottomNavigationBarItem(
                icon: setIcon('register'),
                title: new Text(translator.translate('register')),
              ),
              BottomNavigationBarItem(
                icon: setIcon('home'),
                title: new Text(translator.translate('main')),
              ),
              BottomNavigationBarItem(
                  icon: setIcon('offers'),
                  title: Text(translator.translate('offers'))
              )
            ],
          );
        });
  }
  Widget setIcon(String iconName){
    return SvgPicture.asset(

      "assets/images/$iconName.svg",


    );
  }
}
