import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/button_shape.dart';
import 'file:///C:/Users/raitoa%20pplication/Desktop/projects/ween_arooh/lib/widgets/login_shape/code_pin_shape.dart';
import 'file:///C:/Users/raitoa%20pplication/Desktop/projects/ween_arooh/lib/widgets/login_shape/login_container_shape.dart';
import 'file:///C:/Users/raitoa%20pplication/Desktop/projects/ween_arooh/lib/widgets/login_shape/login_title_shape.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/text_style.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class VerficationCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LoginContainerShape(),
          LoginTilteShape(translator.translate('welcome')),
          Padding(
              padding:  EdgeInsets.only(top:SizeConfig.screenWidth*s50),
              child: Text(translator.translate('code_send')+"  0111258963",
                style: TX_STYLE_black_15.copyWith(
                    color: light_grey
                ),
              )),
          SizedBox(height: SizeConfig.screenWidth*s52,),
          CodePinShape(),
          Padding(
              padding:  EdgeInsets.only(top:SizeConfig.screenWidth*s55),
              child: Text(translator.translate('code_time_arrive'),
                style: TX_STYLE_black_15.copyWith(
                    color: light_grey
                ),
              )),
          SizedBox(height: SizeConfig.screenWidth*s26,),

          ButtonShape(translator.translate('number_editing'), background_color),
          SizedBox(height: SizeConfig.screenWidth*s26,),

          ButtonShape(translator.translate('send_code_again'), dark_grey),



        ],
      ),
    );
  }
}
