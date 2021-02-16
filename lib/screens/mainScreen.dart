import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/widgets/imageSlider.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/appBarShape.dart';
import 'package:ween_arooh/widgets/mainCategoryShape.dart';
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index=0;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
      onTap: (index){
        setState(() {
          _index=index;
        });
      },
          currentIndex: _index, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text(translator.translate('main')),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.app_registration),
              title: new Text(translator.translate('register')),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_offer),
                title: Text(translator.translate('offers'))
            )
          ],
        ),
     body: Column(children: [
       AppBarShape(translator.translate('main')),
       SizedBox(height:SizeConfig.screenWidth*s8),
       ImageSlider(),
       SizedBox(height:SizeConfig.screenWidth*s23),
       Expanded(
         child: GridView.builder(
           padding:  EdgeInsets.all(SizeConfig.screenWidth/40),
           itemCount: 30,
           itemBuilder: (ctx, i) => MainCategoryShape(),
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 3,
             childAspectRatio: (SizeConfig.screenWidth/4)/(SizeConfig.screenWidth/7),
             mainAxisSpacing: SizeConfig.screenWidth/30,


             crossAxisSpacing: SizeConfig.screenWidth/40,
           ),
         ),
       ),


     ],)


    );
  }
}
