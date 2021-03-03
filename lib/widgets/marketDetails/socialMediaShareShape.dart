import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
class SocialMediaShareShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth*s22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(translator.translate('follow_us')),
            Row(children: [
              iconShape("facebook"),
              iconShape("twitter"),
              iconShape("linkedin"),
              iconShape("youtube"),
            ],)

          ],
        ),
      ),
    );
  }
  iconShape(String iconName){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:2.0),
      child: SvgPicture.asset(

          "assets/images/$iconName.svg",
      ),
    );

  }
}
