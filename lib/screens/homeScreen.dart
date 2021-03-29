import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/widgets/appBar/appBarShape.dart';
import 'package:ween_arooh/widgets/imageSlider.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/mainCategoryShape.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketProvider.dart';
import 'package:ween_arooh/services/provider/homeProvider.dart';
class HomeScreen extends StatefulWidget {
  final widgetKey;
  HomeScreen(this.widgetKey);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
   // Provider.of<MarketProvider>(context,listen: false).getMarkets().then((value) => null);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppBarShape(title:translator.translate('main'),openDrawer:   widget.widgetKey,onChange: Provider.of<HomeProvider>(context,listen: false).makeSearch,back:false),
      SizedBox(height:SizeConfig.screenWidth*s8),
      ImageSlider(),
      Expanded(
        child:
        Consumer<HomeProvider>(builder: (context, category, child) {
    bool search=(category.mainCategoryItemsSearch!=null&&category.mainCategoryItemsSearch.length>0);
    return category.waitMainCategory?Center(child: CircularProgressIndicator(),): GridView.builder(
    padding: EdgeInsets.all(SizeConfig.screenWidth / 40),
    itemCount:search? category.mainCategoryItemsSearch.length:category.mainCategoryItems.length,
    itemBuilder: (ctx, i) => MainCategoryShape(item:search?category.mainCategoryItemsSearch[i]:category.mainCategoryItems[i]),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    childAspectRatio: (SizeConfig.screenWidth / 4) /
    (SizeConfig.screenWidth / 7),
    mainAxisSpacing: SizeConfig.screenWidth / 35,


    ),

    );
    })



      )],);
  }
}
