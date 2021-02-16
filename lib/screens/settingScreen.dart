import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/validation.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/widgets/userImageShape.dart';
import 'package:ween_arooh/widgets/settingTextField.dart';
import 'package:ween_arooh/widgets/button_shape.dart';
class SettingScreen extends StatelessWidget {
  TextEditingController _firstNameController = new TextEditingController();

  TextEditingController _lastNameController = new TextEditingController();

  TextEditingController _phoneController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(translator.translate('information'))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8),
            child: Icon(Icons.menu),
          )
        ],
      ),
      body: SingleChildScrollView(
    child: Container(
    height: SizeConfig.screenHeight,
    child: Center(
      child: Padding(
        padding:  EdgeInsets.only(left:SizeConfig.screenWidth*s30,right:SizeConfig.screenWidth*s30 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Padding(
            padding:  EdgeInsets.only( top:SizeConfig.screenWidth*s58,bottom:SizeConfig.screenWidth*s80 ),
            child:
                UserImageShape(),



          ),
            SettingTextField(validate: fnValidName,hint: translator.translate('first_name'),controller:_firstNameController,),
            SettingTextField(validate: fnValidName,hint: translator.translate('last_name'),controller:_lastNameController,),
            SettingTextField(validate: fnValidPhone,hint: translator.translate('mobile'),controller:_phoneController,icon: Icons.mobile_friendly,),
            SizedBox(height: SizeConfig.screenWidth*s71,),
            ButtonShape(
                translator.translate('save'), backgroundColor)
        ],),
      ),
    ),


      ),
    ));
  }
}
