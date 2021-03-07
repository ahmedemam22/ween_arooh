import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketDetailsProvider.dart';
class DisplayOffersShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _offers=Provider.of<MarketDetailsProvider>(context,listen: false).marketDetails.offers;
    return Container(
      height: SizeConfig.screenWidth*s70,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth*s22),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
            Text(translator.translate('offers')),
            SizedBox(height: 5,),
            Expanded(
              child: ListView.builder(
                itemCount: _offers.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i){

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal:3.0),
                      child: Image.network(_offers[i].path??"",width:SizeConfig.screenWidth*s47,height: SizeConfig.screenWidth*s51,fit: BoxFit.fill,),
                    );
                  }

              ),
            ),
          ],
        ),
      ),
    );
  }
}
