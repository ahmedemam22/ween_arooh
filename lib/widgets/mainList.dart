import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketProvider.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/widgets/marketsShape.dart';
class MarketList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Consumer<MarketProvider>(
        builder: (context, market, child) {
          bool search=(market.mainCategoryItemsSearch!=null&&market.mainCategoryItemsSearch.length>0);

          return
            market.waitMarket?Center(child: CircularProgressIndicator(),): GridView.builder(
              padding: EdgeInsets.all(SizeConfig.screenWidth / 40),
              itemCount:search?market.mainCategoryItemsSearch.length:market.markets.length,
              itemBuilder: (ctx, i) => MarketsShape(search?market.mainCategoryItemsSearch[i]:market.markets[i],i),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  mainAxisSpacing: SizeConfig.screenWidth / 35,
                  crossAxisSpacing:  SizeConfig.screenWidth*s30,
                  childAspectRatio: 0.55


              ),

            );
        });
  }
}