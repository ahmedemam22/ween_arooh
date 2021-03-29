import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/userProvider.dart';
class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                child: Consumer<UserProvider>(builder: (context, user, child) {
                  return Text(
                    user.about ?? '', style: TextStyle(
                      fontSize: SizeConfig.screenWidth * s17,
                      color: categoryColor
                  ),);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
