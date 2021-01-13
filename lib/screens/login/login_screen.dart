import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/text_style.dart';
import 'package:ween_arooh/widgets/button_shape.dart';
import 'file:///C:/Users/raitoa%20pplication/Desktop/projects/ween_arooh/lib/widgets/login_shape/login_container_shape.dart';
import 'file:///C:/Users/raitoa%20pplication/Desktop/projects/ween_arooh/lib/widgets/login_shape/login_title_shape.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'file:///C:/Users/raitoa%20pplication/Desktop/projects/ween_arooh/lib/widgets/login_shape/text_phone_shape.dart';
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.screenHeight,
          child: Column(
            children: [
              LoginContainerShape(),
              LoginTilteShape(translator.translate('welcome')),


              SizedBox(height: SizeConfig.screenWidth*s50,),

              TextPhoneShape(),
              SizedBox(height: SizeConfig.screenWidth*s80,),

              ButtonShape(translator.translate('login_enter'),background_color),
              SizedBox(height: SizeConfig.screenWidth*s22,),
              ButtonShape(translator.translate('new_user'),dark_grey),

            ],
          ),
        ),
      ),
    );
  }
}
