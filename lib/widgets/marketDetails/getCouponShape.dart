import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/dialogs.dart';
class GetCopounShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth*s24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(translator.translate('get_coupon')),
              InkWell(
                onTap: (){
                  Dialogs().dialogCopoun(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(translator.translate('copoun_symbol'),style: TextStyle(
                      color: Colors.white
                    ),),
                  )),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.screenWidth*s20,
        ),
        Center(
          child: InkWell(
            onTap: (){
             // CommonAlertRFlutter.alertWithWidgets(context, buttons: [], url:_offers[i].path??"");

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/discount.png",width: SizeConfig.screenWidth*s75,height: SizeConfig.screenWidth*s33 ,),
                Image.asset("assets/images/discount.png",width: SizeConfig.screenWidth*s75,height: SizeConfig.screenWidth*s33 ,),
                Image.asset("assets/images/discount.png",width: SizeConfig.screenWidth*s75,height: SizeConfig.screenWidth*s33 ,),
              ],
            ),
          ),
        )
      ],),
    );
  }
}
