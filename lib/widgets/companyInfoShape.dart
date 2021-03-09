import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/validation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/text_style.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/widgets/text_field.dart';
import 'package:ween_arooh/widgets/dropDown.dart';
class CompanyInfoShape extends StatefulWidget {
  @override
  _CompanyInfoShapeState createState() => _CompanyInfoShapeState();
}

class _CompanyInfoShapeState extends State<CompanyInfoShape> {
  TextEditingController _companyNameCon=TextEditingController();
  TextEditingController _addBranchCon=TextEditingController();

  TextEditingController _responsibillityCon=TextEditingController();
  TextEditingController _countryCon=TextEditingController();
  TextEditingController _adminstrationCon=TextEditingController();

  TextEditingController _telphoneCon=TextEditingController();

  TextEditingController _mobileCon=TextEditingController();

  TextEditingController _emailCon=TextEditingController();

  TextEditingController _websiteCon=TextEditingController();
  bool addBranch=false;

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
                  shape( "company_name",_companyNameCon,"title_ar",true),
                  shape( "responsibillity",_responsibillityCon,"admin_id",true),
                  shape( "country",_countryCon,"location",true),
                  shape( "administration_location",_adminstrationCon,"",true),
                  shape( "branches_location",_addBranchCon,"",true,true),
                  if(addBranch)Container(

                      child: Column(
                        children: [
                          TextFeld(controller: _addBranchCon,),
                          RaisedButton(

                            onPressed: (){

                            },
                            color: backgroundColor,
                            child: Text("Add",style: TextStyle(
                              color: Colors.white
                            ),),
                          )
                        ],
                      ))
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
                shape( "telephone",_telphoneCon,"telephone"),
                shape( "mobile",_mobileCon,"mobile",true),
                shape( "email",_emailCon,"email"),
                shape("website",_websiteCon,"site_link"),
              ],
            ),
          ),


        ),
      ],
    );
  }

  shape(String title,con,key,[bool required=false,add=false]){
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

          TextFeld(controller: con,validate: fnValidName,keyy: key,),
          if(add) InkWell(
            onTap: (){
              setState(() {
                addBranch=!addBranch;

              });

            },
            child: SvgPicture.asset(

              "assets/images/add_branch.svg",
            ),
          ),
        ],
      ),
    );

  }

  shapeDropDown(title,[add=false]){
    return Padding(
      padding:  EdgeInsets.only(top:SizeConfig.screenWidth*s10),
      child: Row(

        children: [
       Text("*",
            style: TX_STYLE_black_15.copyWith(color: red),

          ),

          SizedBox(width: 8,),

          Expanded(
            child: Text(translator.translate(title),
              style: TX_STYLE_black_15,

            ),
          ),
DropDown(items: ["cairo","Giza","Alex"],size: SizeConfig.screenWidth*0.6,),


        ],
      ),
    );

  }
}
