import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/widgets/imageSlider.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/appBarShape.dart';
import 'package:ween_arooh/widgets/marketsShape.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/homeProvider.dart';
import 'package:ween_arooh/widgets/drawer.dart';
import 'package:ween_arooh/widgets/filterShape.dart';
class MarketsScreen extends StatelessWidget {
  static final   GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>(); // ADD THIS LINE

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        key: _scaffoldKey,
        drawer: AppDrawer(),
    body:    Column(children: [
    AppBarShape(title:translator.translate('markets'),openDrawer: _scaffoldKey,),
    SizedBox(height:SizeConfig.screenWidth*s8),
      FilterShape(),
      SizedBox(height:SizeConfig.screenWidth*s13),
      Consumer<HomeProvider>(
          builder: (context, category, child) {
            bool search=(category.mainCategoryItemsSearch!=null&&category.mainCategoryItemsSearch.length>0);
            return Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(SizeConfig.screenWidth / 40),
                itemCount:8,
                itemBuilder: (ctx, i) => MarketsShape(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  mainAxisSpacing: SizeConfig.screenWidth / 35,
                  crossAxisSpacing:  SizeConfig.screenWidth*s20


                ),
              ),
            );
          }),




    ]));
  }
}
