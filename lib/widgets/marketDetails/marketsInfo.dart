import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/rate_shape/rateShape.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketDetailsProvider.dart';
class MarketInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _item=Provider.of<MarketDetailsProvider>(context,listen: false).marketDetails;
    return Container(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth*s23,vertical: SizeConfig.screenWidth*s8),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start ,
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
            Row(
              children: [
                Text(_item.title??"",style: TextStyle(
                  fontSize: SizeConfig.screenWidth*s17
                ),),
                SizedBox(width: 5,),
                RateShape(size: 20,value: _item.rate,)
        ]
            ),
            SizedBox(height: SizeConfig.screenWidth*s9,),
            Text(_item.minDec??""),
            Center(child: Container(
                width: SizeConfig.screenWidth*s130,
                child: Divider(thickness: 1,))),
            Text(_item.location),
            Center(child: Divider(thickness: 1,)),


          ],
        ),
      ),
    );
  }
}
