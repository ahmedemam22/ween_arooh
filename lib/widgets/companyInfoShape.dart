import 'package:flutter/material.dart';
import 'package:ween_arooh/screens/locationView.dart';
import 'package:ween_arooh/utils/validation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/text_style.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/addActivityProvider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  LatLng savedLocation;
  String savedAddress;


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
                 Consumer<AddActivityProvider>(
          builder: (context, add, child) {
            return Container(
              height:add.branchesAddress.length>0?100:0 ,

                child: ListView.builder(
                  itemCount: add.branchesAddress.length,
                  itemBuilder: (context, i) {

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(add.branchesAddress[i]),
                        InkWell(

                            child: Icon(Icons.close),onTap: (){
                              add.removeBranch(i);
                        },)
                      ],
                    );
                  },
                )
                );
          } )

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

          TextFeld(controller: con,validate: fnEmpty,keyy: key,),
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
  saveLocation(LatLng Location, String address) {
    print(address);
    print("cccccccccccc");
    Provider.of<AddActivityProvider>(context,listen: false).addBranch(Location,address);

  }
}
