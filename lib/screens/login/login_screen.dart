import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/widgets/button_shape.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/registerProvider.dart';

import '../../widgets/login_shape/login_container_shape.dart';
import '../../widgets/login_shape/login_title_shape.dart';
import '../../widgets/login_shape/text_phone_shape.dart';
class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _mobileController=TextEditingController();

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

              Form(
                  key: _formKey,
                  child: TextPhoneShape(controller: _mobileController,)),
              SizedBox(height: SizeConfig.screenWidth*s80,),

              InkWell(
                  onTap: (){
                    if(_formKey.currentState.validate()){
                      Provider.of<RegisterProvider>(context,listen: false).login(mobile:_mobileController.text,context: context);
                    }

                  }
                  ,child: ButtonShape(translator.translate('login_enter'),backgroundColor)),
              SizedBox(height: SizeConfig.screenWidth*s22,),
              InkWell(
                  onTap: ()=>  Navigator.pushNamed(context, '/register')
                  ,
                  child: ButtonShape(translator.translate('new_user'),darkGrey)),

            ],
          ),
        ),
      ),
    );
  }

}
