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
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.screenHeight,
          child: ListView(children: [
          AppBarShape(translator.translate('add_activity')),
          SizedBox(height:SizeConfig.screenWidth*s8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 0,
                child: Text(
                  translator.currentLanguage == "en" ? " choose services " : ' اختار الخدمة  ',
                  style: TX_STYLE_black_14,
                  maxLines: 1,
                ),
              ),
              Expanded(flex:1,child: DropDown())
              // urgentServices_TextFieldOptions( translator.currentLanguage == "en" ? 'Services Type' : "نوع الخدمة", black),
            ],),
            CompanyInfoShape(),
            SizedBox(height: 8,),
            CompanyInfoShape(),
            AddImageShape(title: "شعار الشركة",),
            AddImageShape(title: "البانر الرئيسى",),
            AddImageShape(title: "اضف عروض",),
            Container(
              child: Card(
                child: Column(children: [
                  DescriptionShape(title:"وصف مختصر" ,maxLine: 1,),
                  DescriptionShape(title: "وصف تفصيلى",maxLine: 3,),
                ]),
              ),
            ),
            Container(child: Card(
             child: AddImageShape(title: "اضف كوبون خصم",),

            ),),
            ButtonShape("حفظ",backgroundColor)


          ]),
        ),
      ),
    );
  }
}
