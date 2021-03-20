import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'file:///C:/flutterprojects/ween_arooh/lib/widgets/appBar/appBarShape.dart';
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
          AppBarShape(title:translator.translate('offers'),openDrawer: widget.widgetKey,back: false,),
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
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/display_image',arguments: i);
                    },
                    child: Container(
                      width: SizeConfig.screenWidth * s165,
                      height: SizeConfig.screenHeight/3,
                     child: FadeInImage.assetNetwork(
                        placeholder:"assets/images/offers.jpg",
                        fit: BoxFit.fill,
                        image: offers.offersItems[i].panner??"",


                        width:  SizeConfig.screenWidth * s165,
                        height: SizeConfig.screenHeight/3,),

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
