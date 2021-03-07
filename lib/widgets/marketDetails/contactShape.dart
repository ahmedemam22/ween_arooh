import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ween_arooh/utils/launcher.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketDetailsProvider.dart';
class ContactShape extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _item=Provider.of<MarketDetailsProvider>(context,listen: false).marketDetails;
   return  Row(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: [
       InkWell(
           onTap: ()async{

             await launchEmail(_item.email);
           },child: shape(translator.translate('email'),"email")),
       InkWell(
           onTap: ()async{

    await makePhoneCall('tel:01112807193');
           },
           child: shape(translator.translate('call'),"call")),
       InkWell(
           onTap: ()async{

             await launchURL(_item.siteLink);
           },
           child: shape(translator.translate('website'),"website")),

     ],
   );
  }
 Widget shape(String title,String iconName){
    return Container(
      color: lightGray,
      width: SizeConfig.screenWidth*s120,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical:SizeConfig.screenWidth*s5),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center ,
          mainAxisAlignment:MainAxisAlignment.center ,
          children: [
            SvgPicture.asset(

              "assets/images/$iconName.svg",
            ),
            Text(title)
          ],
        ),
      ),
    );

  }
}
