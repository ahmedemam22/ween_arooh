import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ContactShape extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return  Row(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: [
       shape(translator.translate('email'),"email"),
       shape(translator.translate('call'),"call"),
       shape(translator.translate('website'),"website"),

     ],
   );
  }
  shape(String title,String iconName){
    return Container(
      color: lightGray,
      width: SizeConfig.screenWidth*s120,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical:SizeConfig.screenWidth*s5),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center ,
          mainAxisAlignment:MainAxisAlignment.center ,
          children: [
            SvgPicture.asset(

              "assets/images/$iconName.svg",
            ),
            Text(title)
          ],
        ),
      ),
    );

  }
}
