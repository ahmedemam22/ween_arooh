import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/widgets/drawer.dart';
import 'file:///C:/flutterprojects/ween_arooh/lib/widgets/appBar/appBarShape.dart';
import 'package:ween_arooh/widgets/rate_shape/rateHeader.dart';
import 'package:ween_arooh/widgets/rate_shape/percentShape.dart';
import 'package:ween_arooh/widgets/reviewShape.dart';
import 'package:ween_arooh/widgets/button_shape.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class RateScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>(); // ADD THIS LINE

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,

        title: Center(child: Text(translator.translate('rate'))),
      ),
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: Column(children: [
    SizedBox(height:SizeConfig.screenWidth*s8),
        RateHeader(),
        PercentShape(),
        Divider(thickness: 2,),
        ReviewShape(),
        Divider(),
        ReviewShape(),
  Expanded(
    child: Container(
      color: lightGray,
          child: Center(
            child: Container(
                  width: SizeConfig.screenWidth*s175,
                  height:  SizeConfig.screenWidth*s70,
                  child: Center(child: ButtonShape("اكتب تعليق",backgroundColor)),),
          ),
        ),
  ),


    ]));
  }
}
