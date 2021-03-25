import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/country_code.dart';
import 'package:ween_arooh/utils/text_style.dart';
class TextPhoneShape extends StatelessWidget {
  final TextEditingController controller;
  final bool validate;

  const TextPhoneShape({Key key, this.controller, this.validate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:MainAxisAlignment.start ,
      crossAxisAlignment:CrossAxisAlignment.start ,
      children: <Widget>[
        Container(
          width: SizeConfig.screenWidth * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if(translator.currentLanguage == "en")  Expanded(flex:0,child: CountryCode()),

              Expanded(
                flex:1,
                child: Container(
                  width: SizeConfig.screenWidth * 0.65,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextFormField(

                      textDirection: TextDirection.ltr,
                      controller: controller,
                     validator: null,
                     style: TX_STYLE_black_14.copyWith(fontFamily: 'Schelyer',fontWeight: FontWeight.bold),
                     // style: mobileResult == null ? TX_STYLE_black_14Point5.copyWith(color: gray,fontFamily: 'Schelyer') : TX_STYLE_black_14Point5.copyWith(color: red,fontFamily: 'Schelyer'),
                      decoration: InputDecoration(
                        border: InputBorder.none,


                          contentPadding: EdgeInsets.all(0),

                      //  hintStyle: mobileResult == null ? TX_STYLE_black_14Point5.copyWith(color: gray) : TX_STYLE_black_14Point5.copyWith(color: red),
                        hintText: translator.translate('mobile')+' :5xxxxxxxx',
                        hintStyle: TX_STYLE_black_14.copyWith(fontFamily: 'Schelyer',fontWeight: FontWeight.normal),

                      ),
                    ),
                  ),
                ),
              ),
              if(translator.currentLanguage == "ar")     Expanded(flex:0,child: CountryCode()),
            ],
          ),
        ),
        Container(
          width: SizeConfig.screenWidth * 0.9,
          height: 1,
          color: darkGrey,
        ),
       if(validate&&controller.text.length!=9) Text(translator.translate('valid_phone'),style: TextStyle(
          color: Colors.red
        ),)
      ],
    );
  }
}
