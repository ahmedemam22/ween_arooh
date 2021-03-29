import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/rate_shape/rateShape.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/text_style.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketDetailsProvider.dart';
class RateHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isArabic=translator.currentLanguage=="ar";
    final _rate=Provider.of<MarketDetailsProvider>(context,listen: false).rateModel;

    return Column(
      children: [
        Row(children: [
        Padding(
                    padding: const EdgeInsets.symmetric(vertical:2.0,horizontal: 4),
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child:
                        Image.network(_rate.result.market[0].logo??'',width:  SizeConfig.screenWidth*s85,height:  SizeConfig.screenWidth*s66,fit: BoxFit.fill,),

                      ),
                    )

                ,
         SizedBox(width: SizeConfig.screenWidth*s10,),

         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(_rate.result.market[0].title,style: TextStyle(
                fontSize:  SizeConfig.screenWidth*s20
              ),),
    Text(_rate.result.market[0].minDec??'',style: TextStyle(
    fontSize:  SizeConfig.screenWidth*s17,
      color: Colors.grey
    )) ,
           ],
         ),

        ]),
        Padding(
          padding:  EdgeInsets.only(right:isArabic?SizeConfig.screenWidth*0.45:0,left: isArabic?0:SizeConfig.screenWidth*0.45),
          child: Align(

    alignment: Alignment.bottomRight,
            child: Row(
              children: [
                Text(_rate.result.market[0].rate.toString().substring(0,3),style: TX_STYLE_black_14.copyWith(fontFamily: 'Schelyer',),
    ),
                SizedBox(width:  SizeConfig.screenWidth*s5,),
                RateShape(value:_rate.result.market[0].rate ,),


              ],
            ),
          ),
        ),
        Divider(thickness: 2,)

      ],
    );
  }
}
