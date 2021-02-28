import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/appBarShape.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/dropDown.dart';
import 'package:ween_arooh/utils/text_style.dart';
import 'package:ween_arooh/widgets/companyInfoShape.dart';
import 'package:ween_arooh/widgets/addImageShape.dart';
import 'package:ween_arooh/widgets/descriptionShape.dart';
import 'package:ween_arooh/widgets/button_shape.dart';
import 'package:ween_arooh/utils/colors.dart';
class AddActivityScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>(); // ADD THIS LINE

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  Scaffold(
      backgroundColor: lightGray,
      key: _scaffoldKey,

      body:
   Container(
          height: SizeConfig.screenHeight,
          child: Column(children: [
            AppBarShape(title:translator.translate('add_activity'),openDrawer: _scaffoldKey),
            Expanded(
              child: ListView(

                children: [
                  Container(
                    color: lightGray,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: Text(
                            translator.translate('choose_activity'),
                            style: TX_STYLE_black_14,
                            maxLines: 1,
                          ),
                        ),
                        Expanded(flex:1,child: DropDown())
                        // urgentServices_TextFieldOptions( translator.currentLanguage == "en" ? 'Services Type' : "نوع الخدمة", black),
                      ],),
                  ),
                  CompanyInfoShape(),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical:8.0),
                    child: Container(
                      child:  Column(children: [
                        DescriptionShape(title:translator.translate('brief_description') ,maxLine: 1,),
                        DescriptionShape(title: translator.translate('detailed_description'),maxLine: 3,),
                      ]),
                    ),
                  ),

                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth*s20),
                      child: Column(
                        children: [
                          AddImageShape(title: translator.translate('company_logo'),),
                          AddImageShape(title: translator.translate('main_banner'),),
                          AddImageShape(title: translator.translate('add_offers'),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenWidth*s10,),



                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth*s20),
                      child: AddImageShape(title: translator.translate('add_copoun'),),
                    ),

                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical:SizeConfig.screenWidth*s24),
                    child: Container(
                        width: SizeConfig.screenWidth*s175,
                        height:  SizeConfig.screenWidth*s70,
                        child: Center(child: ButtonShape(translator.translate('save'),backgroundColor))),
                  )
                ],
              ),
            ),



          ]),
        ),

    );
  }
}