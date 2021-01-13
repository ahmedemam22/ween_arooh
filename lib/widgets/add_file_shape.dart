import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/text_style.dart';
class AddFileShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:SizeConfig.screenWidth*s41),
      child: Row(
        children: [
          Text(translator.translate('add_image'),
            style: TX_STYLE_black_15,

          ),
          SizedBox(width: SizeConfig.screenWidth*s32,),
          Container(
            width: SizeConfig.screenWidth*0.25,
            decoration: BoxDecoration(
                border: Border.all(color: light_grey),
              borderRadius: BorderRadius.all(Radius.circular(15))

            ),
            child: Row(
              children: [
                Image.asset('assets/images/person.png',width: SizeConfig.blockSizeHorizontal*10,

                height:  SizeConfig.blockSizeHorizontal*10,),
                Text(translator.translate('choose_file'),
                style: TX_STYLE_black_14.copyWith(fontSize: SizeConfig.screenWidth*s10),)

              ],
            ),
          ),
        ],
      ),
    );
  }
}
