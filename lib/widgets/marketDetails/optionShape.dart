import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share/share.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/utils/glopal_app.dart';
import 'package:ween_arooh/services/provider/marketDetailsProvider.dart';
import 'package:ween_arooh/utils/dialogs.dart';
class OptionShape extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/rate",arguments: Provider.of<MarketDetailsProvider>(context,listen: false).marketDetails.id);
              },
              child: shape(translator.translate('review'),"visitors_opinion")),
        ),
       shape(translator.translate('add_num'),"contact"),
        Expanded(
          child: InkWell(
              onTap: (){
                Share.share(Provider.of<MarketDetailsProvider>(context,listen: false).marketDetails.siteLink);
              },child: shape(translator.translate('share'),"share")),
        ),
        Expanded(
          child: InkWell(
              onTap: ()async{
                if(GlopalApp.user==null){
                  Dialogs().awsomeDialogWithCancel(context: context,type: DialogType.ERROR,title: translator.translate('sorry'),
                      desc: translator.translate('valid_login'),onClick: ()=>Navigator.pushNamed(context, '/login') );
                }
                else {
                  await Dialogs().rateDialog(context);
                  await Dialogs().awsomeDialog(context: context,
                      title: translator.translate('success'),
                      type: DialogType.SUCCES,
                      desc: translator.translate('success_rate'));
                }
              },
              child: shape(translator.translate('add_rate'),"favorite")),
        ),
      ],
    );

  }
  Widget shape(String title,String iconName){
    return
      Card(
          color: lightGray,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:3.0),
            child: Container(
              height: SizeConfig.screenWidth*s37,
              width: SizeConfig.screenWidth*s95,
              color: lightGray,
              child: Row(
                children: [
                  SvgPicture.asset(

                    "assets/images/$iconName.svg",
                  ),
                  SizedBox(width: 3,),
                  Expanded(
                    child: Text(title,
                      style: TextStyle(
                          fontSize: SizeConfig.screenWidth*s12
                      ),),
                  ),
                ],



              ),
            ),
          ),
        
      );
  }
}
