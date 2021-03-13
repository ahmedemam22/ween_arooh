import 'package:flutter/material.dart';
import 'package:ween_arooh/services/provider/addActivityProvider.dart';
import 'file:///C:/flutterprojects/ween_arooh/lib/widgets/appBar/appBarShape.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/dropDown.dart';
import 'package:ween_arooh/utils/text_style.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/homeProvider.dart';
import 'package:ween_arooh/widgets/drawer.dart';
import 'package:ween_arooh/widgets/companyInfoShape.dart';
import 'package:ween_arooh/widgets/addImageShape.dart';
import 'package:ween_arooh/widgets/descriptionShape.dart';
import 'package:ween_arooh/widgets/marketDetails/addSocialMedia.dart';
import 'package:ween_arooh/widgets/button_shape.dart';
import 'package:ween_arooh/utils/colors.dart';
class AddActivityScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>(); // ADD THIS LINE
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  Scaffold(
      backgroundColor: lightGray,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Center(child: Text(translator.translate('add_activity'))),


      ),
      drawer: AppDrawer(),

      body:
   Container(
          height: SizeConfig.screenHeight,
          child: Column(children: [
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
                        Expanded(flex:1,child: DropDown(items:Provider.of<HomeProvider>(context,listen: false).categoriesList(),hint: translator.translate('choose_activity'),
                        onChange:Provider.of<AddActivityProvider>(context,listen: false).setData("category_id", Provider.of<HomeProvider>(context).getCategoryId)
                          ,))
                        // urgentServices_TextFieldOptions( translator.currentLanguage == "en" ? 'Services Type' : "نوع الخدمة", black),
                      ],),
                  ),
                  Form(
                      key: _formKey,
                      child: CompanyInfoShape()),
                  AddSocialMedia(),

                  Padding(
                    padding:  EdgeInsets.symmetric(vertical:8.0),
                    child: Container(
                      child:  Column(children: [
                        DescriptionShape(title:translator.translate('brief_description') ,maxLine: 1,keyy:
                        "min_dec_ar",),
                        DescriptionShape(title: translator.translate('detailed_description'),maxLine: 3,keyy:  "dec_ar",),
                      ]),
                    ),
                  ),

                  Container(
                    color: Colors.white,
                    child:  Consumer<AddActivityProvider>(
                        builder: (context, add, child) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.screenWidth * s20),
                                child: Column(
                                  children: [

                                    AddImageShape(title: translator.translate(
                                        'company_logo'),
                                        images: add.logoImage,
                                        onSelectImage: add.addImageBanner),
                                    AddImageShape(title: translator.translate(
                                        'main_banner'),
                                      images: add.bannerImage,
                                      onSelectImage: add.addImageBanner,),

                                    AddImageShape(title: translator.translate(
                                        'add_offers'),
                                        images: add.offerImage,
                                        onSelectImage: add.addOffers),
                                    SizedBox(
                                      height: SizeConfig.screenWidth * s10,),


                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth*s20),
                                  child: AddImageShape(title: translator.translate('add_copoun'),addCoupoun: true,images: add.copounImage,onSelectImage: add.addCopoun,),
                                ),

                              ),

                              Padding(
                                padding:  EdgeInsets.symmetric(vertical:SizeConfig.screenWidth*s24),
                                child: Container(
                                      width: SizeConfig.screenWidth*s175,
                                      height:  SizeConfig.screenWidth*s70,
                                      child:  Center(child:add.waitAddActivity?CircularProgressIndicator(): GestureDetector(
                                          onTap: ()async{
                                            if(_formKey.currentState.validate())
                                             await add.addActivity(context);


                                          },
                                          child: ButtonShape(translator.translate('save'),backgroundColor)))),
                                ),

                            ],
                          );
                        }),
                  ),

                ],
              ),
            ),



          ]),
        ),

    );
  }
}