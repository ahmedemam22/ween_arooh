import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class TextFeld extends StatelessWidget {
  final String hintText;
  final  controller;
  final validate;

  TextFeld({this.hintText, this.controller, this.validate});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth*0.58,
      child: TextFormField(
      controller: controller,
        validator:validate ,
          keyboardType: hintText=="mobile"?TextInputType.number:TextInputType.name,

        // style: mobileResult == null ? TX_STYLE_black_14Point5.copyWith(color: gray,fontFamily: 'Schelyer') : TX_STYLE_black_14Point5.copyWith(color: red,fontFamily: 'Schelyer'),
        decoration: InputDecoration(
          //  hintStyle: mobileResult == null ? TX_STYLE_black_14Point5.copyWith(color: gray) : TX_STYLE_black_14Point5.copyWith(color: red),
          hintText: hintText!=null?translator.translate(hintText):"",
        ),
      ),
    );
  }
}
