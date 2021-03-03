import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/widgets/imageSlider.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/appBarShape.dart';
import 'package:ween_arooh/widgets/marketsShape.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketProvider.dart';
import 'package:ween_arooh/widgets/drawer.dart';
import 'package:ween_arooh/widgets/filterShape.dart';
class MarketsScreen extends StatefulWidget {
  static final   GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  _MarketsScreenState createState() => _MarketsScreenState();
}

class _MarketsScreenState extends State<MarketsScreen> {
  @override
  void initState() {
    Provider.of<MarketProvider>(context,listen: false).getMarkets().then((value) => null);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        key: MarketsScreen._scaffoldKey,
        drawer: AppDrawer(),
    body:    Column(children: [
    AppBarShape(title:translator.translate('markets'),openDrawer: MarketsScreen._scaffoldKey,onChange: Provider.of<MarketProvider>(context,listen: false).marketSearch,),
    SizedBox(height:SizeConfig.screenWidth*s8),
      FilterShape(),
      SizedBox(height:SizeConfig.screenWidth*s13),
      Expanded(
              child:
    Consumer<MarketProvider>(
    builder: (context, market, child) {
    bool search=(market.marketsFilter!=null&&market.marketsFilter.length>0);

    return
    market.markets==null?Center(child: CircularProgressIndicator(),): GridView.builder(
                padding: EdgeInsets.all(SizeConfig.screenWidth / 40),
                itemCount:search?  market.marketsFilter.length:market.markets.length,
                itemBuilder: (ctx, i) => MarketsShape(search?  market.marketsFilter[i]:market.markets[i],i),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  mainAxisSpacing: SizeConfig.screenWidth / 35,
                  crossAxisSpacing:  SizeConfig.screenWidth*s20


                ),

            );
          }),




      )]));
  }
}
