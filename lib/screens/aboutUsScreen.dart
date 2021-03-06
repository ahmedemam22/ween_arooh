import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/widgets/drawer.dart';
class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
     appBar: AppBar(
       backgroundColor: backgroundColor,
        title: Center(child: Text(translator.translate('about_us'))),

      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
        Expanded(
            child: Padding(
              padding:  EdgeInsets.only(top:SizeConfig.screenWidth*s120,left:SizeConfig.screenWidth*s20,
              right: SizeConfig.screenWidth*s20),
              child: Text("من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن"
                  " من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن"
                  " من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحنv من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن من نحن"
                  ""
                  "",style: TextStyle(
                fontSize: SizeConfig.screenWidth*s17,
                color: categoryColor
              ),),
            ),
          )
        ],
      ),
    );
  }
}
