import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/rate_shape/rateShape.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/text_style.dart';
class RateHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isArabic=translator.currentLanguage=="ar";

    return Column(
      children: [
        Row(children: [
       Container(
            height:  SizeConfig.screenWidth*s85,
            width:  SizeConfig.screenWidth*s100,
            child: Card(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child:  Padding(
                    padding: const EdgeInsets.symmetric(vertical:2.0),
                    child: Image.asset('assets/images/othemImage.png',width:  SizeConfig.screenWidth*s85,height:  SizeConfig.screenWidth*s66,fit: BoxFit.fill,),
                  ),
                )),
         SizedBox(width: SizeConfig.screenWidth*s10,),

         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("اسواق عبدالله العثيم",style: TextStyle(
                fontSize:  SizeConfig.screenWidth*s20
              ),),
    Text("البيع بالجملة والتجزئة",style: TextStyle(
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
                Text("3.7",style: TX_STYLE_black_14.copyWith(fontFamily: 'Schelyer',),
    ),
                SizedBox(width:  SizeConfig.screenWidth*s5,),
                RateShape(),


              ],
            ),
          ),
        ),
        Divider(thickness: 2,)

      ],
    );
  }
}
