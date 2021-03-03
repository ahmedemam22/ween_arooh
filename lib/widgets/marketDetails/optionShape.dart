import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class OptionShape extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        shape(translator.translate('review'),Icons.rate_review),
       shape(translator.translate('add_num'),Icons.contact_phone),
        shape(translator.translate('share'),Icons.share),
        shape(translator.translate('add_rate'),Icons.favorite),
      ],
    );

  }
  shape(String title,IconData icon){
    return
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:3.0),
          child: Container(
            height: SizeConfig.screenWidth*s37,
            width: SizeConfig.screenWidth*s95,
            color: lightGray,
            child: Row(
              children: [
                Icon(icon),
                Text(title,      overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: SizeConfig.screenWidth*s12
                  ),),
              ],



            ),
          ),
        ),
      );
  }
}
