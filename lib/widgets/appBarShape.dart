import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/widgets/searchTextField.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class AppBarShape extends StatelessWidget {
  final String title;
  AppBarShape(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenWidth*s125,
      color: backgroundColor,
      child: Padding(
        padding:  EdgeInsets.only(top:SizeConfig.screenWidth*s50,left: SizeConfig.screenWidth*s14,
            right: SizeConfig.screenWidth*s14),
        child: Column(
          children: [
            Text(title,style: TextStyle(
              fontSize: SizeConfig.screenWidth*s17,
              color: Colors.white
            ),),
            SizedBox(
              height: SizeConfig.screenWidth*s10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Icon(Icons.menu,color: Colors.white,size: SizeConfig.screenWidth*s35,),

   Container(
                        height: SizeConfig.screenWidth*s30,
                        width: SizeConfig.screenWidth*(s200+s90),
                        child: ClipRect(
                          child: Row(
                            children: [

                              Container(
                                    width:title==translator.translate('offers')?SizeConfig.screenWidth*(s175):SizeConfig.screenWidth*(s200+s90),
                                    child:

                                SearchTextField()),

                              if(title==translator.translate('offers'))
                                SizedBox(width: SizeConfig.screenWidth*s20,),
                              if(title==translator.translate('offers'))
                                   Container(
                                       width: SizeConfig.screenWidth*(s90),
                                       child: SearchTextField())

                            ],
                          ),
                        ),
                      ),

                Icon(Icons.arrow_back_ios_outlined,color: Colors.white,)

              ],
                ),


              ],
            )

        ),

    );
  }
}
