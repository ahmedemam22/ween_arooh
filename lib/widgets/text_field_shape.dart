import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/text_style.dart';
import 'package:ween_arooh/widgets/text_field.dart';
class TextFieldShape extends StatelessWidget {
  final String hintName;
  final TextEditingController controller;
  final validate ;

  TextFieldShape({this.hintName, this.controller, this.validate});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:SizeConfig.screenWidth*s10),
      child: Row(
        children: [
          Expanded(
            child: Text(translator.translate(hintName),
              style: TX_STYLE_black_15,

            ),
          ),
          SizedBox(width: 1,),
          Padding(
            padding:  EdgeInsets.only(top:20.0),
            child: Text("*",
              style: TX_STYLE_black_15.copyWith(color: red),

            ),
          ),
          TextFeld(controller: controller,validate: validate,hintText: hintName,),
        ],
      ),
    );
  }
}
