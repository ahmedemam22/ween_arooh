import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/launcher.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketDetailsProvider.dart';
class SocialMediaShareShape extends StatelessWidget {
  BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context=context;
    final _item=Provider.of<MarketDetailsProvider>(context,listen: false).marketDetails;
    return Container(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth*s22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(translator.translate('follow_us')),
            Row(children: [
              iconShape("facebook",_item.facebook),
              iconShape("twitter",_item.twitter),
              iconShape("linkedin",_item.linkedin),
              iconShape("youtube",_item.youtube),
            ],)

          ],
        ),
      ),
    );
  }
  iconShape(String iconName,String link){
    return InkWell(
      onTap: ()async{

        await launchURL(link,_context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:2.0),
        child: SvgPicture.asset(

            "assets/images/$iconName.svg",
        ),
      ),
    );

  }
}
