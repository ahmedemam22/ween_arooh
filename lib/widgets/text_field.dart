import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/addActivityProvider.dart';
class TextFeld extends StatelessWidget {
  final String hintText;
  final  controller;
  final  String keyy;
  final validate;

  TextFeld({this.hintText, this.controller, this.validate, this.keyy});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth*0.58,
      child: TextFormField(
      controller: controller,
        validator:validate ,
          keyboardType: hintText=="mobile"?TextInputType.number:TextInputType.name,
        onChanged: (value){
        Provider.of<AddActivityProvider>(context,listen: false).setData(keyy, value);

        },

        // style: mobileResult == null ? TX_STYLE_black_14Point5.copyWith(color: gray,fontFamily: 'Schelyer') : TX_STYLE_black_14Point5.copyWith(color: red,fontFamily: 'Schelyer'),
        decoration: InputDecoration(
          //  hintStyle: mobileResult == null ? TX_STYLE_black_14Point5.copyWith(color: gray) : TX_STYLE_black_14Point5.copyWith(color: red),
          hintText: hintText!=null?translator.translate(hintText):"",
        ),
      ),
    );
  }
}
