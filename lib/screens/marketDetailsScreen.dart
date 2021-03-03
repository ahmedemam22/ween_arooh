import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/drawer.dart';
import 'package:ween_arooh/widgets/appBarShape.dart';
import 'file:///C:/flutterprojects/ween_arooh/lib/widgets/marketDetails/locationShape.dart';
import 'file:///C:/flutterprojects/ween_arooh/lib/widgets/marketDetails/getCouponShape.dart';
import 'file:///C:/flutterprojects/ween_arooh/lib/widgets/marketDetails/socialMediaShareShape.dart';
import 'package:ween_arooh/widgets/ImageSliderMarket.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'file:///C:/flutterprojects/ween_arooh/lib/widgets/marketDetails/displayOffersShape.dart';
import 'file:///C:/flutterprojects/ween_arooh/lib/widgets/marketDetails/optionShape.dart';
import 'file:///C:/flutterprojects/ween_arooh/lib/widgets/marketDetails/marketsInfo.dart';
import 'file:///C:/flutterprojects/ween_arooh/lib/widgets/marketDetails/contactShape.dart';
class MarketDetailsScreen extends StatefulWidget {
  @override
  _MarketDetailsScreenState createState() => _MarketDetailsScreenState();
}

class _MarketDetailsScreenState extends State<MarketDetailsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: Column(children: [
      AppBarShape(title:"اسواق العثيم",openDrawer: _scaffoldKey,),
        Expanded(
          child: ListView(
            children: [
              ImageSliderMarket(),
             OptionShape(),
              MarketInfo(),
              ContactShape(),
              Divider(thickness: 1,),
              SocialMediaShareShape(),
              Divider(thickness: 1,),
              DisplayOffersShape(),
              Divider(thickness: 1,),
              GetCopounShape(),
              Divider(thickness: 1,),
              LocationShape()





            ] )


        )])  );


  }
}
