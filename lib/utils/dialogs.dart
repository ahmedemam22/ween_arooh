import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/addRateShape.dart';
import 'package:ween_arooh/utils/text_style.dart';
class Dialogs{
  awsomeDialog({context,type,title,desc,onClick}){
    return AwesomeDialog(

      context: context,
      dialogType:type,
      animType: AnimType.BOTTOMSLIDE,
      title: title,

      desc: desc,
      btnOkText: translator.translate('ok'),


      btnOkOnPress: () {
        print('cliccccccccccck');
        onClick;

      },

      btnOkColor: backgroundColor,

    )..show();
  }
  awsomeDialogWithCancel({context,type,title,desc,Function onClick}){
    return AwesomeDialog(

      context: context,
      dialogType:type,
      animType: AnimType.BOTTOMSLIDE,
      title: title,
      desc: desc,
      btnOkText: translator.translate('ok'),
      btnCancelText: translator.translate('cancel'),

      btnOkOnPress:
        onClick,


      btnOkColor: backgroundColor,
      btnCancelOnPress: (){

      }

    )..show();
  }
  Future<bool> dialogCopoun( context,String code) async {
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
                            code??"123ABCD",
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

  Future rateDialog(context)async{
    return await showDialog(
        context: context,
        builder: (_) => new Dialog(
          backgroundColor: Colors.transparent,
          child: new Container(
              alignment: FractionalOffset.center,
              width: SizeConfig.screenWidth * (s200+s120),
              padding: const EdgeInsets.all(20.0),
              child:  AddRateShape()
          ),
        ));
  }
  Future<bool> FN_showDetails_Dialog(BuildContext context, String title, String body) async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text(title),
        content: new Text(body, style: TX_STYLE_black_14Point5.copyWith(fontFamily: 'Schelyer') ),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: new Text(translator.translate('ok')),
          ),
//          new FlatButton(
//            onPressed: () => Navigator.of(context).pop(true),
//            child: new Text('Yes'),
//          ),
        ],
      ),
    )) ??
        false;
  }
}