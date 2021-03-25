import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/text_style.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
class SettingTextField extends StatelessWidget {
  final validate;
  final String hint;
  final TextEditingController controller;
  final IconData icon;

  const SettingTextField({Key key, this.validate, this.hint, this.controller, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding:  EdgeInsets.only(top:SizeConfig.screenWidth*s15),
      child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextFormField(
              style: TX_STYLE_black_14.copyWith(fontFamily: 'Schelyer'),

              validator: validate,
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: categoryColor,width:2),
                ),

                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: gray),
                ),
                suffixIcon: Icon(Icons.edit, size: SizeConfig.screenWidth*0.06),
                prefixIcon: Icon(icon??Icons.person, size: SizeConfig.screenWidth*0.07),
              ),
            ),
          ),

      ),
    );

  }
}
