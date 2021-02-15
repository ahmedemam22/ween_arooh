import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/button_shape.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/text_style.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../widgets/login_shape/code_pin_shape.dart';
import '../../widgets/login_shape/login_container_shape.dart';
import '../../widgets/login_shape/login_title_shape.dart';
class VerficationCodeScreen extends StatelessWidget {
  final _mobileController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _mobile=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Column(
        children: [
          LoginContainerShape(),
          LoginTilteShape(translator.translate('welcome')),
          Padding(
              padding:  EdgeInsets.only(top:SizeConfig.screenWidth*s50),
              child: Text(translator.translate('code_send')+"  $_mobile",
                style: TX_STYLE_black_15.copyWith(
                    color: lightGrey
                ),
              )),
          SizedBox(height: SizeConfig.screenWidth*s52,),
          CodePinShape(controller: _mobileController,),
          Padding(
              padding:  EdgeInsets.only(top:SizeConfig.screenWidth*s55),
              child: Text(translator.translate('code_time_arrive'),
                style: TX_STYLE_black_15.copyWith(
                    color: lightGrey
                ),
              )),
          SizedBox(height: SizeConfig.screenWidth*s26,),

          ButtonShape(translator.translate('number_editing'), backgroundColor),
          SizedBox(height: SizeConfig.screenWidth*s26,),

          ButtonShape(translator.translate('send_code_again'), darkGrey),



        ],
      ),
    );
  }
}
