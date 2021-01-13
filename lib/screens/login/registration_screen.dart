import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/widgets/button_shape.dart';
import 'file:///C:/Users/raitoa%20pplication/Desktop/projects/ween_arooh/lib/widgets/login_shape/login_container_shape.dart';
import 'file:///C:/Users/raitoa%20pplication/Desktop/projects/ween_arooh/lib/widgets/login_shape/login_title_shape.dart';
import 'package:ween_arooh/widgets/add_file_shape.dart';
import 'package:ween_arooh/widgets/text_field_shape.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class RegistrationScreen extends StatelessWidget {
  //
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.screenHeight,
          child: Column(
            children: [
              LoginContainerShape(color: dark_white,register: "register",),
              LoginTilteShape(translator.translate('login')),
              Padding(
                padding:  EdgeInsets.fromLTRB(SizeConfig.screenWidth*s24,SizeConfig.screenWidth*s56, SizeConfig.screenWidth*s24,

                0),
                child: Form(
                  child: Column(
                    children: [
                      TextFieldShape(name:"first_name"),
                      TextFieldShape(name:"last_name"),
                      TextFieldShape(name:"mobile"),
                      AddFileShape(),


                      SizedBox(height: SizeConfig.screenWidth*s57,),
                      ButtonShape(translator.translate('register'), background_color)

                    ],
                  ),

                ),
              )

              
            ],
          ),
        ),
      ),
    );
  }

}
