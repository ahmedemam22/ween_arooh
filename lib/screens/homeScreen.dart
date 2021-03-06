import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/widgets/imageSlider.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'file:///C:/flutterprojects/ween_arooh/lib/widgets/appBar/appBarShape.dart';
import 'package:ween_arooh/widgets/mainCategoryShape.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/homeProvider.dart';
class HomeScreen extends StatelessWidget {
  final widgetKey;
  HomeScreen(this.widgetKey);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppBarShape(title:translator.translate('main'),openDrawer:   widgetKey,onChange: Provider.of<HomeProvider>(context,listen: false).makeSearch,),
      SizedBox(height:SizeConfig.screenWidth*s8),
      ImageSlider(),
      Consumer<HomeProvider>(
          builder: (context, category, child) {
            bool search=(category.mainCategoryItemsSearch!=null&&category.mainCategoryItemsSearch.length>0);
      return category.waitMainCategory ? Center(child: CircularProgressIndicator()) : Expanded(
        child: GridView.builder(
          padding: EdgeInsets.all(SizeConfig.screenWidth / 40),
          itemCount:search? category.mainCategoryItemsSearch.length:category.mainCategoryItems.length,
          itemBuilder: (ctx, i) => MainCategoryShape(item:search?category.mainCategoryItemsSearch[i]:category.mainCategoryItems[i]),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: (SizeConfig.screenWidth / 4) /
                (SizeConfig.screenWidth / 7),
            mainAxisSpacing: SizeConfig.screenWidth / 35,


          ),
        ),
      );
    }),


    ],);
  }

}
