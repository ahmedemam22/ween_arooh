import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/text_style.dart';
class Dialogs{
  awsomeDialog({context,type,title,desc}){
    return AwesomeDialog(
      context: context,
      dialogType:type,
      animType: AnimType.BOTTOMSLIDE,
      title: title,
      desc: desc,
      btnOkOnPress: () {},
      btnOkColor: backgroundColor,

    )..show();
  }
  Future<bool> dialogCopoun( context) async {
    return await showDialog(
      context: context,
      builder: (context) => Container(
        width: SizeConfig.screenWidth * (s200+s120),
        height: SizeConfig.screenHeight * s100,
        child: new AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 0.01, vertical: 0.01),
          content: Container(
            width: SizeConfig.screenWidth * (s200+s120),
            height: SizeConfig.screenWidth * s120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

              //  _TextFielCode(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: SizeConfig.screenWidth * s60,

                        child: new FlatButton(
                          onPressed: () async{

                            },
                          child: new Text(
                            translator.translate('copoun_symbol'),
                            style: TX_STYLE_white_14point5,
                          ),
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: SizeConfig.screenWidth * s60,
                        child: new FlatButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: new Text(
                            "123ABCD",
                            style: TX_STYLE_black_14Point5.copyWith(
                                color: Colors.grey[700]

                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    color: lightGray,
                    height: SizeConfig.screenWidth * s60,
                    width: SizeConfig.screenWidth ,
                    child: new FlatButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: new Text(
                        translator.translate('copoun_copy'),
                        style: TX_STYLE_black_14Point5.copyWith(
                          color: Colors.grey[700]
                        ),

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ) ??
        false;
  }
  Future<bool> dialogDiscount( context) async {
    return await showDialog(
      context: context,
      builder: (context) => Container(
        width: SizeConfig.screenWidth * (s200+s120),
        height: SizeConfig.screenHeight * s130,
        child: new AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 0.01, vertical: 0.01),
          content: Container(
            width: SizeConfig.screenWidth * (s200+s120),
            height: SizeConfig.screenWidth * s130,
            child: Image.asset('assets/images/discount.png',fit: BoxFit.fill,),
          ),
        ),
      ),
    ) ??
        false;
  }
  Future<bool> discount( context) async {
    return await showDialog(
      context: context,
      builder: (context) =>  new AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 0.01, vertical: 0.01),
          content: Column(
            children: [
              Container(
                color: Colors.white,
                width: SizeConfig.screenWidth * (s50),
                height: SizeConfig.screenWidth * s50,
                child: Center(child: Text("ادخل التقييم"))
              ),
            ],
          ),
        ),

    ) ??
        false;
  }
}