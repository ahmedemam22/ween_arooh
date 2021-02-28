import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/rate_shape/percentRateShape.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
class PercentShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(children: [
            Text("3.7",style: TextStyle(
              fontSize: SizeConfig.screenWidth*s56
            ),),
            Text("17 مشاهدة",style: TextStyle(
                fontSize: SizeConfig.screenWidth*s15
            ),),
          ],),
          SizedBox(
            width:SizeConfig.screenWidth*s20 ,
          ),
          Column(
            children: [
              PercentRateShape(percent: 1,number: "5",),
              PercentRateShape(percent: 0,number: "4",),
              PercentRateShape(percent: 0.5,number: "3",),
              PercentRateShape(percent: 0.3,number: "2",),
              PercentRateShape(percent: 0.4,number: "1",),

            ],
          ),
        ],
      ),
    );
  }
}
