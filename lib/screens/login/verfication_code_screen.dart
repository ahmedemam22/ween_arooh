import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/button_shape.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/text_style.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/registerProvider.dart';
import '../../widgets/login_shape/code_pin_shape.dart';
import '../../widgets/login_shape/login_container_shape.dart';
import '../../widgets/login_shape/login_title_shape.dart';
import 'package:ween_arooh/model/verficationModel.dart';
class VerficationCodeScreen extends StatelessWidget {
  final _mobileController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final VerficationModel _model=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: ListView(
        children: [
          LoginContainerShape(),
          LoginTilteShape(translator.translate('welcome')),
          Center(
            child: Padding(
                padding:  EdgeInsets.only(top:SizeConfig.screenWidth*s50),
                child: Text(translator.translate('code_send')+_model.mobile  ,
                  style: TX_STYLE_black_15.copyWith(
                      color: lightGrey
                   ,fontFamily: 'Schelyer'

                ),
                )),
          ),
          SizedBox(height: SizeConfig.screenWidth*s52,),
          CodePinShape(controller: _mobileController,),
       /*   Center(
            child: Padding(
                padding:  EdgeInsets.only(top:SizeConfig.screenWidth*s55),
                child: Text(translator.translate('code_time_arrive'),
                  style: TX_STYLE_black_15.copyWith(
                      color: lightGrey
                  ),
                )),
          ),*/
          SizedBox(height: SizeConfig.screenWidth*s26,),

    Consumer<RegisterProvider>(
    builder: (context, register, child) {
      return register.waitVerficationCode?Center(child: CircularProgressIndicator(),):InkWell(
          onTap: ()async {
           await register.verfiy(context,_mobileController.text);

          }
          ,
          child: ButtonShape(translator.translate('login'), backgroundColor));

    }),
          SizedBox(height: SizeConfig.screenWidth*s26,),
/*
    Consumer<RegisterProvider>(
    builder: (context, register, child) {
         return register.waitResendCode?Center(child:CircularProgressIndicator()):InkWell(
              onTap: ()async=> _model.code=await register.resend(_model.mobile) ,
              child: ButtonShape(translator.translate('send_code_again'), darkGrey));}
        ),

*/

        ],
      ),
    );
  }
}
