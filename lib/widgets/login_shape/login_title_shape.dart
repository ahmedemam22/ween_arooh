import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/text_style.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class LoginTilteShape extends StatelessWidget {
  final String text;
  LoginTilteShape(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:  EdgeInsets.only(top:SizeConfig.screenWidth*s30),
        child: Column(
          children: [
            Text(text,
              style: TX_STYLE_white_16.copyWith(
                  color: light_grey
              ),
            ),
            SizedBox(height: 2,),
            Container(
              width: SizeConfig.blockSizeHorizontal * 40,
              height: 1,
              color: light_grey,
            ),
          ],
        ));
  }
}
