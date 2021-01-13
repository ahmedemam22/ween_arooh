import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/country_code.dart';
class TextPhoneShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                    child: TextField(
                      textDirection: TextDirection.ltr,
                    //  controller: _mobile_Controller,
                     // style: mobileResult == null ? TX_STYLE_black_14Point5.copyWith(color: gray,fontFamily: 'Schelyer') : TX_STYLE_black_14Point5.copyWith(color: red,fontFamily: 'Schelyer'),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      //  hintStyle: mobileResult == null ? TX_STYLE_black_14Point5.copyWith(color: gray) : TX_STYLE_black_14Point5.copyWith(color: red),
                        hintText: translator.translate('mobile'),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(flex:0,child: CountryCode()),
            ],
          ),
        ),
        Container(
          width: SizeConfig.screenWidth * 0.9,
          height: 1,
          color: dark_grey,
        ),
      ],
    );
  }
}
