import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/widgets/appBar/appBarShape.dart';
import 'package:ween_arooh/widgets/imageSlider.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/mainList.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketProvider.dart';
import 'package:ween_arooh/widgets/drawer.dart';
import 'package:ween_arooh/widgets/filterShape.dart';
import 'package:ween_arooh/services/provider/homeProvider.dart';
class MarketsScreen extends StatefulWidget {
  static final   GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  _MarketsScreenState createState() => _MarketsScreenState();
}

class _MarketsScreenState extends State<MarketsScreen> {

  String _title;
  @override
  void didChangeDependencies() {
    _title=ModalRoute.of(context).settings.arguments;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        key: MarketsScreen._scaffoldKey,
        drawer: AppDrawer(),
        body:    Column(children: [
          AppBarShape(title:_title,openDrawer: MarketsScreen._scaffoldKey,onChange: Provider.of<MarketProvider>(context,listen: false).marketSearch,),
          SizedBox(height:SizeConfig.screenWidth*s8),
          FilterShape(),
          SizedBox(height:SizeConfig.screenWidth*s13),
          Expanded(
            child :FutureBuilder(
    future:   Provider.of<MarketProvider>(context,listen: false).getMarkets( Provider.of<HomeProvider>(context,listen: false).getCategoryId(_title)),
    builder: (ctx, dataSnapshot) {
    if (dataSnapshot.connectionState ==
    ConnectionState.waiting) {
    return Center(child:CircularProgressIndicator());
    } else {
    if (dataSnapshot.error != null) {
    // ...
    // Do error handling stuff
    return Center(
    child: Text(translator.translate('error')),
    );
    } else {
    return Consumer<MarketProvider>(
    builder: (context, details, child) {
    return details.waitMarket ? Center(
    child: CircularProgressIndicator()) : MarketList();});


    }}}))]));
  }
}
