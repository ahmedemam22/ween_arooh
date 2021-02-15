import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/widgets/button_shape.dart';
import 'package:ween_arooh/widgets/add_file_shape.dart';
import 'package:ween_arooh/utils/validation.dart';
import 'package:ween_arooh/widgets/text_field_shape.dart';
import 'package:ween_arooh/services/provider/registerProvider.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'dart:io';

import '../../widgets/login_shape/login_container_shape.dart';
import '../../widgets/login_shape/login_title_shape.dart';
import 'package:provider/provider.dart';
class RegistrationScreen extends StatelessWidget {
  //
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firsNameController=TextEditingController();
  final TextEditingController _lastNameController=TextEditingController();
  final TextEditingController _mobileController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
          height: SizeConfig.screenHeight,
          child: SingleChildScrollView(
            child: Column(
              children: [
                LoginContainerShape(color: darkWhite,register: "register",),
                LoginTilteShape(translator.translate('login')),
                Padding(
                  padding:  EdgeInsets.fromLTRB(SizeConfig.screenWidth*s24,SizeConfig.screenWidth*s56, SizeConfig.screenWidth*s24,

                  0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFieldShape(hintName:"first_name",controller: _firsNameController,validate: fnValidName,),
                        TextFieldShape(hintName:"last_name",controller: _lastNameController,validate: fnValidName,),
                        TextFieldShape(hintName:"mobile",controller: _mobileController,validate: fnValidPhone,),
    AddFileShape(),


                        SizedBox(height: SizeConfig.screenWidth*s57,),
    Selector<RegisterProvider, bool>(
    selector: (context, register) =>
    register.waitRegister,
    builder: (context, value, child) {
      return value?Center(child: CircularProgressIndicator(),): InkWell(
          onTap: () => register(context),
          child: ButtonShape(
              translator.translate('register'), backgroundColor));
    })

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
register(context)async{
    if(_formKey.currentState.validate()){
     await Provider.of<RegisterProvider>(context,listen: false).register(
       fName: _firsNameController.text,
       lName: _lastNameController.text,
       mobile: _mobileController.text,
       context: context
     );
    }
}
}
