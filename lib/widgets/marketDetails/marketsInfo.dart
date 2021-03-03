import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/rate_shape/rateShape.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
class MarketInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth*s23,vertical: SizeConfig.screenWidth*s8),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start ,
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
            Row(
              children: [
                Text("اسواق عبد الله العثيم",style: TextStyle(
                  fontSize: SizeConfig.screenWidth*s17
                ),),
                SizedBox(width: 5,),
                RateShape(size: 20,)
        ]
            ),
            SizedBox(height: SizeConfig.screenWidth*s9,),
            Text("مجال البيع بالجملة والتجزئة للمواد الغذائية والاستهلاكية"),
            Center(child: Container(
                width: SizeConfig.screenWidth*s130,
                child: Divider(thickness: 1,))),
            Text("طريق صلاح الدين الايوبى / الرياض / الملز"),
            Center(child: Divider(thickness: 1,)),


          ],
        ),
      ),
    );
  }
}
