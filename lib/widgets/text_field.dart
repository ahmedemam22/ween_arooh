import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class TextFeld extends StatelessWidget {
  final String hint_text;

  TextFeld({this.hint_text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth*0.58,
      child: TextField(
        //  controller: _mobile_Controller,
        // style: mobileResult == null ? TX_STYLE_black_14Point5.copyWith(color: gray,fontFamily: 'Schelyer') : TX_STYLE_black_14Point5.copyWith(color: red,fontFamily: 'Schelyer'),
        decoration: InputDecoration(
          //  hintStyle: mobileResult == null ? TX_STYLE_black_14Point5.copyWith(color: gray) : TX_STYLE_black_14Point5.copyWith(color: red),
          hintText: hint_text!=null?translator.translate(hint_text):"",
        ),
      ),
    );
  }
}
