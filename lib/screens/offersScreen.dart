import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/appBarShape.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/offersProviders.dart';
class OffersScreen extends StatefulWidget {
  final widgetKey;
  OffersScreen(this.widgetKey);

  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  void didChangeDependencies() {
    Provider.of<OffersProvider>(context,listen: false).getOffers().then((value) => null);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Column(
        children: [
          AppBarShape(title:translator.translate('offers'),openDrawer: widget.widgetKey,),
          Expanded(
            child:  Consumer<OffersProvider>(
          builder: (context, offers, child) {
            return offers.waitOffers?Center(child: CircularProgressIndicator(),):GridView.builder(
              padding: EdgeInsets.fromLTRB(
                  SizeConfig.screenWidth * s30, SizeConfig.screenWidth * s17,
                  SizeConfig.screenWidth * s30
                  , 0),
              itemCount: offers.offersItems.length,
              itemBuilder: (ctx, i) =>
                  Container(
                    width: SizeConfig.screenWidth * s165,
                    height: SizeConfig.screenWidth * (s200 + s36),
                    child: Image.network(offers.offersItems[i].panner??""
                      , width: SizeConfig.screenWidth * s165,
                      fit: BoxFit.fill,
                      height: SizeConfig.screenWidth * (s200 + s200),
                    ),
                  ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: SizeConfig.screenWidth / 30,
                  crossAxisSpacing: SizeConfig.screenWidth * s18


              ),
            );
          }),
          ),

        ],
      ),
    );
  }
}
