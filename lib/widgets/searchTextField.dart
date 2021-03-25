import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/homeProvider.dart';
class SearchTextField extends StatelessWidget {
  final Function onChange;
  final String hint;
  final bool region;
  SearchTextField(this.onChange, {this.hint, this.region=false});
  @override
  Widget build(BuildContext context) {
    return TextFormField(




      onChanged:
        onChange
      ,


      decoration: new InputDecoration(
        border: new OutlineInputBorder(




          borderRadius:  BorderRadius.all(
            Radius.circular(SizeConfig.screenWidth*s30),
          ),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),

        ),


contentPadding: EdgeInsets.only(top: 3,left: translator.currentLanguage=='ar'?0:2,right: translator.currentLanguage=='ar'?2:0),
        hintText:hint,

        filled: true,
        fillColor: Colors.white,
       suffixIcon: region? Icon(Icons.search):null,
       prefixIcon: !region? Icon(Icons.search):null,




      ),
    );
  }
}
