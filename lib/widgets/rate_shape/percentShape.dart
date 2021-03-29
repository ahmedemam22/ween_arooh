import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/rate_shape/percentRateShape.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketDetailsProvider.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class PercentShape extends StatelessWidget {
   int _total;

  @override
  Widget build(BuildContext context) {
    final _result=Provider.of<MarketDetailsProvider>(context,listen: false).rateModel.result;
    calculateTotal(_result.count);

    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(children: [
              Text(_result.market[0].rate.toString().substring(0,3),style: TextStyle(
                fontSize: SizeConfig.screenWidth*s40,
                  fontFamily: 'Schelyer'
              ),),
              Text(_result.market[0].visitscount+translator.translate('view'),style: TextStyle(
                  fontSize: SizeConfig.screenWidth*s15,
                  fontFamily: 'Schelyer'
              ),),
            ],),
          ),
          SizedBox(
            width:SizeConfig.screenWidth*s10 ,
          ),
          Expanded(
            flex: 4,

          child: Column(
              children: [
                PercentRateShape(percent: (_result.count['5']/_total).toDouble()/100,number: "5",),
                PercentRateShape(percent: (_result.count['4']/_total).toDouble()/100,number: "4",),
                PercentRateShape(percent: (_result.count['3']/_total).toDouble()/100,number: "3",),
                PercentRateShape(percent:(_result.count['2']/_total).toDouble()/100,number: "2",),
                PercentRateShape(percent: (_result.count['1']/_total).toDouble()/100,number: "1",),

              ],
            ),
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
