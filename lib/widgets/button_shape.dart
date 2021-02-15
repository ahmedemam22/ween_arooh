import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/my_padding.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/text_style.dart';
class ButtonShape extends StatelessWidget {
  final String text;
  final Color color;
  ButtonShape(this.text, this.color);
  @override
  Widget build(BuildContext context) {
    return   Card(
        elevation: 10,
        child: Container(
          width: SizeConfig.screenWidth * 0.7,
          height: SizeConfig.screenHeight * 0.08,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Padding(
            padding: paddingSymmetric(verticalFactor: 2),
            child: Center(
              child: Text(
                text,
                style: TX_STYLE_white_16
              ),
            ),
          ),
        ),
        color: color,

    );
  }
}
