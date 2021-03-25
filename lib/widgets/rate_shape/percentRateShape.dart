import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
class PercentRateShape extends StatelessWidget {
  final double percent;
  final String number;

  const PercentRateShape({Key key, this.percent, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(top:8.0),
      child: LinearPercentIndicator(

        width: SizeConfig.screenWidth*0.7,
        animation: true,
        animationDuration: 1000,
        lineHeight: 20.0,
        trailing: Row(
          children: [
            SizedBox(width: 10,),

            Text(number,style: TextStyle(
              fontSize: SizeConfig.screenWidth*s17,
                fontFamily: 'Schelyer'
            ),),

          ],
        ),

        percent: percent,
        linearStrokeCap: LinearStrokeCap.roundAll,
        progressColor: Colors.grey,
      ),
    );
  }
}
