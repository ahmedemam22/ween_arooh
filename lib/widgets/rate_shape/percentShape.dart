import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/rate_shape/percentRateShape.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketDetailsProvider.dart';
class PercentShape extends StatelessWidget {
   int _total;

  @override
  Widget build(BuildContext context) {
    final _count=Provider.of<MarketDetailsProvider>(context,listen: false).rateModel.result.count;
    calculateTotal(_count);

    return Container(
      child: Row(
        children: [
          Column(children: [
            Text("3.7",style: TextStyle(
              fontSize: SizeConfig.screenWidth*s40,
                fontFamily: 'Schelyer'
            ),),
            Text("17 مشاهدة",style: TextStyle(
                fontSize: SizeConfig.screenWidth*s15,
                fontFamily: 'Schelyer'
            ),),
          ],),
          SizedBox(
            width:SizeConfig.screenWidth*s20 ,
          ),
          Column(
            children: [
              PercentRateShape(percent: (_count['5']/_total).toDouble()/100,number: "5",),
              PercentRateShape(percent: (_count['4']/_total).toDouble()/100,number: "4",),
              PercentRateShape(percent: (_count['3']/_total).toDouble()/100,number: "3",),
              PercentRateShape(percent:(_count['2']/_total).toDouble()/100,number: "2",),
              PercentRateShape(percent: (_count['1']/_total).toDouble()/100,number: "1",),

            ],
          ),
        ],
      ),
    );
  }
  calculateTotal(Map<String,int>count){
    _total=0;
    count.forEach((key, value) {_total+=value;});

  }
}
