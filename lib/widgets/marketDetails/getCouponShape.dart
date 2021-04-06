import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:ween_arooh/utils/flutterAlertDialog.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketDetailsProvider.dart';
class GetCopounShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _coupon=Provider.of<MarketDetailsProvider>(context,listen: false).marketDetails.coupons;

    return Container(
      height: SizeConfig.screenWidth*s100,

      child: Column(children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth*s24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(translator.translate('get_coupon')),
           InkWell(
                onTap: (){
                  Dialogs().dialogCopoun(context,_coupon[0].code);
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
        Expanded(
          child: Center(


    child:ListView.builder(
          itemCount: _coupon.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i){

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal:3.0),
              child: InkWell(
                  onTap: (){
                    CommonAlertRFlutter.alertWithWidgets(context, buttons: [], url:_coupon[i].path??"");

                  },
                  child: Image.network(_coupon[i].path??"",width:SizeConfig.screenWidth*s90,height: SizeConfig.screenWidth*s60,fit: BoxFit.fill,)),
            );
          }

    ),
    ),
        )
        ]  ),
        );


  }
}
