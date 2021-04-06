import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/userProvider.dart';
import 'package:ween_arooh/widgets/bottomNavigationBar.dart';
class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar:  BottomnavigationBar(main_Screen: false),
       appBar: AppBar(
         backgroundColor: backgroundColor,
          title: Center(child: Text(translator.translate('about_us'))),

        ),
        drawer: AppDrawer(),
        body: RefreshIndicator(
          onRefresh:     Provider.of<UserProvider>(context,listen: false).aboutUs
          ,
          child: ListView(
            children: [
            Padding(
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

            ],
          ),
        ),
      ),
    );
  }
}
