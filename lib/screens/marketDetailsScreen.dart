import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/drawer.dart';
import 'package:ween_arooh/utils/colors.dart';

import 'package:ween_arooh/widgets/ImageSliderMarket.dart';
import 'package:ween_arooh/utils/size_config.dart';

import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketDetailsProvider.dart';
import 'package:ween_arooh/widgets/marketDetails/contactShape.dart';
import 'package:ween_arooh/widgets/marketDetails/displayOffersShape.dart';
import 'package:ween_arooh/widgets/marketDetails/getCouponShape.dart';
import 'package:ween_arooh/widgets/marketDetails/locationShape.dart';
import 'package:ween_arooh/widgets/marketDetails/marketsInfo.dart';
import 'package:ween_arooh/widgets/marketDetails/optionShape.dart';
import 'package:ween_arooh/widgets/marketDetails/socialMediaShareShape.dart';
class MarketDetailsScreen extends StatefulWidget {
  @override
  _MarketDetailsScreenState createState() => _MarketDetailsScreenState();
}

class _MarketDetailsScreenState extends State<MarketDetailsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<MarketDetailsProvider>(context,listen: false).getMarketDetails().then((value) => null);
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: backgroundColor,

        title: Center(child: Text("اسواق العثيم")),

      ),
      body:  Consumer<MarketDetailsProvider>(
    builder: (context, details, child) {
      return details.waitMarketDetails ? Center(
          child: CircularProgressIndicator()) : Column(children: [
        Expanded(
            child: ListView(
                children: [
                  ImageSliderMarket(),
                  SizedBox(height: 5,),
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


                ])


        )
      ]);
    })  );


  }
}
