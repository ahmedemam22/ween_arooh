import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/validation.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/widgets/userImageShape.dart';
import 'package:ween_arooh/widgets/settingTextField.dart';
import 'package:ween_arooh/widgets/drawer.dart';
import 'package:ween_arooh/model/userModel.dart';
import 'package:ween_arooh/widgets/button_shape.dart';
import 'package:ween_arooh/services/provider/userProvider.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/utils/glopal_app.dart';
class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  TextEditingController _firstNameController = new TextEditingController();

  TextEditingController _lastNameController = new TextEditingController();

  TextEditingController _phoneController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
@override
  void initState() {
  _firstNameController.text = GlopalApp.user.fName;
  _lastNameController.text =  GlopalApp.user.lName;
  _phoneController.text =  GlopalApp.user.mobile;
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Center(child: Text(translator.translate('information'))),

        ),
        drawer: AppDrawer(),
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
              Form(
                key: _formKey,
                  child: Column(
                    children: [
                      SettingTextField(validate: fnValidName,hint: translator.translate('first_name'),controller:_firstNameController,),
                      SettingTextField(validate: fnValidName,hint: translator.translate('last_name'),controller:_lastNameController,),
                      SettingTextField(validate: fnValidPhone,hint: translator.translate('mobile'),controller:_phoneController,icon: Icons.mobile_friendly,),
                      SizedBox(height: SizeConfig.screenWidth*s71,),
                    ],
                  )),

        Consumer<UserProvider>(
            builder: (context, user, child) {
              return user.waitSetting ? Center(child: CircularProgressIndicator()) : InkWell(
                  onTap: ()async{
                 if(_formKey.currentState.validate()){   await user.updateProfile(User(fName: _firstNameController.text
                    ,lName: _lastNameController.text,mobile: _phoneController.text),context);
                  }},
                  child:
       ButtonShape(
            translator.translate('save'), backgroundColor));
      } ),
              ]),
              )
          ),
        ),
      ),


        ),
    );

  }
}
