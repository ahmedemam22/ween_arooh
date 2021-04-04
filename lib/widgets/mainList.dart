import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketProvider.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/widgets/marketsShape.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/services/provider/homeProvider.dart';
class MarketList extends StatefulWidget {
  @override
  _MarketListState createState() => _MarketListState();
}

class _MarketListState extends State<MarketList> {
  ScrollController _scrollController = ScrollController();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData().then((value) => null);

      }
    });

}
  Future _getMoreData() async {
    Provider.of<MarketProvider>(context,listen: false).getMarkets( Provider.of<HomeProvider>(context,listen: false).selectedId,true) ;
}

  @override
  Widget build(BuildContext context) {
    return  Consumer<MarketProvider>(
        builder: (context, market, child) {
          bool search=(market.mainCategoryItemsSearch!=null&&market.mainCategoryItemsSearch?.length>0);
          int count=search?market.mainCategoryItemsSearch?.length:market.markets?.length;

          return
            market.waitMarket?Center(child: CircularProgressIndicator(),):count==0?
            Center(child: Text(translator.translate('no_markets'),style: TextStyle(
              fontSize: SizeConfig.screenWidth*s20
            ),),):
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: GridView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.all(SizeConfig.screenWidth / 40),
                    itemCount:search?market.mainCategoryItemsSearch.length:market.markets?.length,
                    itemBuilder: (ctx, i) => MarketsShape(search?market.mainCategoryItemsSearch[i]:market.markets[i],i),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,

                        mainAxisSpacing: SizeConfig.screenWidth / 35,
                        crossAxisSpacing:  SizeConfig.screenWidth*s30,
                        childAspectRatio: 0.55


                    ),

                  ),
                ),

                if(market.waitPagination) Expanded(
                  flex: 1,
                    child: Center(child: CircularProgressIndicator(),))
              ],
            );

        });
  }
}
