import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/addActivityProvider.dart';
import 'package:ween_arooh/utils/text_style.dart';
import 'package:ween_arooh/screens/locationView.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
class TextFeld extends StatefulWidget {
  final String hintText;
  final  controller;
  final  String keyy;
  final validate;

  TextFeld({this.hintText, this.controller, this.validate, this.keyy});

  @override
  _TextFeldState createState() => _TextFeldState();
}

class _TextFeldState extends State<TextFeld> {
  BuildContext _context;
@override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    if(Provider.of<AddActivityProvider>(context,listen: false).oldMArket!=null){

      widget.controller.text=Provider.of<AddActivityProvider>(context,listen: false).oldMArket[widget.keyy];
    }
    else{
      //widget.controller.text='';
    }

    _context=context;
    return Container(
      width: SizeConfig.screenWidth*0.58,

        child: TextFormField(
          onTap:(){

        if( widget.keyy==""|| widget.keyy=="location")    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    LocationView(
                      savedLocation: saveLocation,
                    )));
          },
        controller: widget.controller,
            readOnly: widget.keyy==""|| widget.keyy=="location",
          validator:(v){
          if(widget.validate!=null){
         if( widget.validate(v)==null){
           Provider.of<AddActivityProvider>(context,listen: false).setData(widget.keyy, v);
         }
         else {
           return translator.translate('add_data');
         }

          }
          else if(v.length>0) Provider.of<AddActivityProvider>(context,listen: false).setData(widget.keyy, v);

        }
          ,
          style: TX_STYLE_black_14.copyWith(fontFamily: 'Schelyer'),


          keyboardType: widget.hintText=="mobile"?TextInputType.number:TextInputType.name,
          onChanged: (value){

          if(widget.hintText=='branch'){
            if(value.length==0){
              Provider.of<AddActivityProvider>(context,listen: false).removeBranch(0);
            }
          }

          },

          // style: mobileResult == null ? TX_STYLE_black_14Point5.copyWith(color: gray,fontFamily: 'Schelyer') : TX_STYLE_black_14Point5.copyWith(color: red,fontFamily: 'Schelyer'),
          decoration: InputDecoration(
              hintStyle: TX_STYLE_black_14.copyWith(fontFamily: 'Schelyer',fontWeight: FontWeight.normal),

          //  hintStyle: mobileResult == null ? TX_STYLE_black_14Point5.copyWith(color: gray) : TX_STYLE_black_14Point5.copyWith(color: red),
            hintText: widget.hintText!=null&&widget.hintText!='branch'?widget.hintText=='mobile'?translator.translate(widget.hintText)+' :5xxxxxxxx':translator.translate(widget.hintText):"",
          ),
        ),

    );
  }

    saveLocation(LatLng Location, String address) {
   Provider.of<AddActivityProvider>(_context,listen: false).setAdminLoication(Location);
   widget.controller.text=address;
   setState(() {

   });

    }
}
