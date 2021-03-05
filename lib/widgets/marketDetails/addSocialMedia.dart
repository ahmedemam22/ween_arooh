import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/dropDown.dart';
import 'package:ween_arooh/widgets/text_field.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
class AddSocialMedia extends StatelessWidget {
  TextEditingController _socialCon=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical:8.0),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(translator.translate('social_media')),
            Row(
              children: [
                DropDown(items:["facebook","twitter","youtube","linkedin"],size:SizeConfig.screenWidth*s120),
                TextFeld(controller: _socialCon,keyy: "social",),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
