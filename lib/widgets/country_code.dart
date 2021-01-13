import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/text_style.dart';
class CountryCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      return Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CountryCodePicker(
              //  onChanged: _onCountryChange,
                dialogTextStyle: TX_STYLE_black_14.copyWith(fontFamily: 'NUMBER '),
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'sa',
                favorite: ['+966', 'SA'],
                // optional. Shows only country name and flag
                showCountryOnly: false,
                // optional. Shows only country name and flag when popup is closed.
                showOnlyCountryWhenClosed: false,
                // optional. aligns the flag and the Text left
                alignLeft: false,
              //  onInit: _onCountryChange,
                textStyle: TX_STYLE_black_14.copyWith(fontFamily: 'Schelyer'),

              ),
              Icon(
                Icons.arrow_drop_down,
                color:gray,
              )
            ],
          ),
          Container(
            color: gray,
            height: 1,
            width: SizeConfig.safeAreaVertical * 4,
          )
        ],
      );

  }
}
