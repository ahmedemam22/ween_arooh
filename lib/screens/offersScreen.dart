import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/offersProviders.dart';
import 'package:ween_arooh/services/provider/homeProvider.dart';
import 'package:ween_arooh/widgets/appBar/appBarShape.dart';
import 'package:ween_arooh/widgets/drawer.dart';
class OffersScreen extends StatefulWidget {


  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  void didChangeDependencies() {
    Provider.of<OffersProvider>(context,listen: false).getOffers().then((value) => null);

    super.didChangeDependencies();
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>(); // ADD THIS LINE

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: AppDrawer(),

        body: Column(
          children: [
            AppBarShape(title:translator.translate('offers'),openDrawer: _scaffoldKey,back: false,onChange:Provider.of<OffersProvider>(context,listen: false).nameSearch,
            onChangeOffer:Provider.of<OffersProvider>(context,listen: false).locationSearch ,),
            Expanded(
              child:  Consumer<OffersProvider>(
            builder: (context, offers, child) {
              int count=offers.offersSearch!=null? offers.offersSearch.length:offers.offersItems?.length;

              return offers.waitOffers?Center(child: CircularProgressIndicator(),):count==0?Center(child:
                Text(translator.translate('no_offers'),
                style: TextStyle(
                  fontSize: SizeConfig.screenWidth*s20
                ),),):GridView.builder(
                padding: EdgeInsets.fromLTRB(
                    SizeConfig.screenWidth * s30, SizeConfig.screenWidth * s17,
                    SizeConfig.screenWidth * s30
                    , 0),
                itemCount:offers.offersSearch!=null? offers.offersSearch.length:offers.offersItems.length,
                itemBuilder: (ctx, i) {
                var item=offers.offersSearch!=null?offers.offersSearch[i]:offers.offersItems[i];
                    return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, '/display_image',arguments: i);
                      },
                      child: Container(
                        width: SizeConfig.screenWidth * s165,
                        height: SizeConfig.screenHeight/3,
                       child: FadeInImage.assetNetwork(
                          placeholder:"assets/images/offers.jpg",
                          fit: BoxFit.fill,
                          image: item.offers[0].path??"",


                          width:  SizeConfig.screenWidth * s165,
                          height: SizeConfig.screenHeight/3,),

                      ),
                );},
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: SizeConfig.screenWidth / 30,
                    crossAxisSpacing: SizeConfig.screenWidth * s18,
                  childAspectRatio: 0.6


                ),
              );
            }),
            ),

          ],
        ),
      ),
    );
  }
}
