import 'package:flutter/material.dart';
import 'package:ween_arooh/screens/locationView.dart';
import 'package:ween_arooh/utils/validation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/text_style.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ween_arooh/widgets/addImageShape.dart';
import 'package:ween_arooh/widgets/descriptionShape.dart';
import 'package:ween_arooh/widgets/marketDetails/addSocialMedia.dart';
import 'package:ween_arooh/widgets/button_shape.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/addActivityProvider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ween_arooh/widgets/text_field.dart';
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
  LatLng savedLocation;
  String savedAddress;
  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Consumer<AddActivityProvider>(
          builder: (context, add, child) {
            return
             Column(
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
                        shape( "branches_location",_addBranchCon,"",true,true,add.branchesAddress.length>0?add.branchesAddress[0]:null),
                     Container(
                  height:add.branchesAddress.length>0?100:0 ,

                    child: ListView.builder(
                      itemCount: add.branchesAddress.length>0?add.branchesAddress.length-1:0,
                      itemBuilder: (context, i) {

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(add.branchesAddress[i+1]),
                            InkWell(

                                child: Icon(Icons.close),onTap: (){
                                  add.removeBranch(i);
                            },)
                          ],
                        );
                      },
                    )
                    )


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
                                onSelectImage: add.addLogo,
                            onRemoveImage:  add.removeLogo,),
                            AddImageShape(title: translator.translate(
                                'main_banner'),
                              images: add.bannerImage,
                              onSelectImage: add.addImageBanner,
                            onRemoveImage: add.removeImageBanner,
                            ),



                      Padding(
                        padding:  EdgeInsets.symmetric(vertical:SizeConfig.screenWidth*s24),
                        child: Container(
                            width: SizeConfig.screenWidth*s175,
                            height:  SizeConfig.screenWidth*s70,
                            child:  Center(child:add.waitAddActivity?CircularProgressIndicator(): InkWell(
                                onTap: ()async{
                                  if(add.category==null){
                                    Dialogs().awsomeDialog(context: context,title: translator.translate('sorry'),desc:translator.translate('valid_activity'),type: DialogType.ERROR);
                                  }
                                 else{ if(_formKey.currentState.validate()){

                                    await add.addActivity(context);}
                                  else{
                                    print("ssssssssssssss");
                                  }}


                                },

                                child: ButtonShape(translator.translate('save'),backgroundColor)))),
                      ),

                    ],
                  ))]);
                }),
          ),

        ]);
  }),
    );
  }

  shape(String title,con,key,[bool required=false,add=false,branch]){
   if(branch!=null&&con.text.length==0)con.text=branch;
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

          TextFeld(controller: con,validate: required?fnEmpty:null,keyy: key,hintText: add?'branch':null,),
          if(add) InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocationView(
                  savedLocation: saveLocation,
                )),
              );



            },
            child: SvgPicture.asset(

              "assets/images/add_branch.svg",
            ),
          ),
        ],
      ),
    );

  }


  saveLocation(LatLng Location, String address) {
    print(address);
    print("cccccccccccc");
    Provider.of<AddActivityProvider>(context,listen: false).addBranch(Location,address);

  }
}
