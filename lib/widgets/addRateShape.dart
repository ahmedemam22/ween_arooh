import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/rate_shape/makeRate.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/widgets/text_field.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketDetailsProvider.dart';
class AddRateShape extends StatelessWidget {
  TextEditingController _commentCon=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.only(top: SizeConfig.screenWidth*s20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.all(Radius.circular(5))

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:5.0,vertical: 4),
                child: Text(translator.translate('enter_rate'),style: TextStyle(
                  fontSize: SizeConfig.screenWidth*s21
                ),),
              ),
            ),
            SizedBox(height: 5,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))

              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth*s15,vertical: SizeConfig.screenWidth*s5),
                child: MakeRate(),
              ),
            ),
            SizedBox(height: SizeConfig.screenWidth*s80,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.all(Radius.circular(5))

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:5.0,vertical: 4),
                child: Text(translator.translate('write_comment'),style: TextStyle(
                    fontSize: SizeConfig.screenWidth*s21
                ),),
              ),
            ),
            SizedBox(height: SizeConfig.screenWidth*s10,),
            Container(
              color: Colors.white,
              height: SizeConfig.screenWidth*s165,
              width: SizeConfig.screenWidth*200,
              child: Align(
                  child: TextFeld(controller: _commentCon,)),
            ),
            SizedBox(height: 5,),
    Consumer<MarketDetailsProvider>(
    builder: (context, details, child) {
      return details.waitMakeRate
          ? Center(child: CircularProgressIndicator())
          : Container(
        height: SizeConfig.screenWidth * s40,
        width: SizeConfig.screenWidth * s120,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white)
        ),
        child: RaisedButton(child: Text(translator.translate('send'),

          style: TextStyle(color: Colors.white),
        ), color: backgroundColor,
          onPressed: () async{
           await Provider.of<MarketDetailsProvider>(context, listen: false).addRate(
                _commentCon.text,);


          /* await Dialogs().FN_showDetails_Dialog(context, translator.translate('success'), translator.translate('success_rate'),
           );*/
           Navigator.pop(context, true);    /*  await Dialogs().awsomeDialog(context: context,
      title: translator.translate('success'),
      type: DialogType.SUCCES,
      desc: translator.translate('success_rate'),onClick:()=>Navigator.pop(context) );*/
      


          },

        ),
      );
    })


          ],
        ),
      ),
    );
  }
}
