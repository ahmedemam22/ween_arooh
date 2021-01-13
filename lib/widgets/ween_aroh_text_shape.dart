import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/text_style.dart';
class WenArohTextShape extends StatelessWidget {
  final String register;

  const WenArohTextShape({Key key, this.register}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          translator.translate('ween_aroh'),
          style: TX_STYLE_white_16.copyWith(fontFamily: "DROID",
              color: register!=null?background_color:white,
              fontSize: SizeConfig.screenWidth*s41),
        ),
        SizedBox(width: SizeConfig.screenWidth*s15,),
        Padding(
          padding:  EdgeInsets.only(top:20.0),
          child: Text(
            translator.translate('wtg'),
            style: TX_STYLE_white_16.copyWith(fontFamily: "kARTIKA",
                fontSize: SizeConfig.screenWidth*s36,
                color: register!=null?black:white,

                fontWeight: FontWeight.bold),
          ),
        ),


      ],
    );
  }
}
