import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/text_field_shape.dart';
import 'package:ween_arooh/utils/validation.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/text_style.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/widgets/text_field.dart';
class CompanyInfoShape extends StatelessWidget {
  TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth*s10,
            vertical: SizeConfig.screenWidth*s20),
            child: Column(
                children: [
                  shape( "company_name",true),
                  shape( "responsibillity",true),
                  shape( "country",true),
                  shape( "administration_location",true),
                  shape("branches_location",),
                ],
              ),
          ),


        ),
        SizedBox(height: 8,),
        Container(
          color: Colors.white,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth*s10,
                vertical: SizeConfig.screenWidth*s20),
            child: Column(
              children: [
                shape( "telephone"),
                shape( "mobile",true),
                shape( "fax"),
                shape( "email"),
                shape("website",),
              ],
            ),
          ),


        ),
      ],
    );
  }
  shape(String title,[bool required=false]){
   return Padding(
      padding:  EdgeInsets.only(top:SizeConfig.screenWidth*s10),
      child: Row(
        children: [
       if(required)   Text("*",
              style: TX_STYLE_black_15.copyWith(color: red),

            ),

          SizedBox(width: 8,),

          Expanded(
            child: Text(translator.translate(title),
              style: TX_STYLE_black_15,

            ),
          ),

          TextFeld(controller: _controller,validate: fnValidName,hintText: title,),
        ],
      ),
    );

  }
}