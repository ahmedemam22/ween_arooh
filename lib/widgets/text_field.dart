import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/addActivityProvider.dart';
import 'package:ween_arooh/utils/text_style.dart';
import 'package:ween_arooh/screens/locationView.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ween_arooh/utils/dialogs.dart';

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
  bool _change=false;
  var prov;
  @override
  Widget build(BuildContext context) {
   prov=Provider.of<AddActivityProvider>(context,listen: true);
    if(prov.oldMArket!=null&&prov.checkOldMArket&&!_change){
     if( prov.oldMArket[widget.keyy]!=null) widget.controller.text=prov.oldMArket[widget.keyy];
    }
    else if(!_change&& !(widget.keyy==""|| widget.keyy=="location")){
      widget.controller.text='';
    }

    _context=context;
    return Container(
            width: SizeConfig.screenWidth * 0.58,

            child: TextFormField(
              onTap: () {


                if (widget.keyy == "" || widget.keyy == "location") {
                  prov.setCity(null, _context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          LocationView(
                            savedLocation: saveLocation,
                            initialPosition: LatLng(double.parse(prov
                                .selectedCity.latitude), double.parse(prov
                                .selectedCity.longitude)),
                          )));
                }
              },

              controller: widget.controller,
              readOnly: widget.keyy == "" || widget.keyy == "location",
              validator: (v) {
                if (widget.validate != null) {
                  if (widget.validate(v) == null) {
                    Provider.of<AddActivityProvider>(context, listen: false)
                        .setData(widget.keyy, v);
                  }
                  else {
                    return translator.translate('add_data');
                  }

                }
                else if (v.length > 0) prov.setData(widget.keyy, v);
              }
              ,
              style: TX_STYLE_black_14.copyWith(fontFamily: 'Schelyer'),


              keyboardType: widget.keyy == "mobile" ||
                  widget.keyy == "telephone" || widget.hintText=="mobile"
                  ? TextInputType.number
                  : TextInputType.name,
              onChanged: (value) {
                _change = true;
                print('chaaange');

                if (widget.hintText == 'branch') {
                  if (value.length == 0) {
                    prov.removeBranch(0);
                  }
                }
              },

              // style: mobileResult == null ? TX_STYLE_black_14Point5.copyWith(color: gray,fontFamily: 'Schelyer') : TX_STYLE_black_14Point5.copyWith(color: red,fontFamily: 'Schelyer'),
              decoration: InputDecoration(
                hintStyle: TX_STYLE_black_14.copyWith(
                    fontFamily: 'Schelyer', fontWeight: FontWeight.normal),

                //  hintStyle: mobileResult == null ? TX_STYLE_black_14Point5.copyWith(color: gray) : TX_STYLE_black_14Point5.copyWith(color: red),
                hintText: widget.hintText != null && widget.hintText != 'branch'
                    ? widget.hintText == 'mobile' ? translator.translate(
                    widget.hintText) + ' :5xxxxxxxx' : translator.translate(
                    widget.hintText)
                    : "",
              ),
            ),

          );

  }

    saveLocation(LatLng Location, String address) {
      widget.controller.text='';
      print(address);
      print('ccccccccccccc');

      if (Location==null){

      Location=LatLng(double.parse(prov.selectedCity.latitude),double.parse(prov.selectedCity.longitude));
    }
   Provider.of<AddActivityProvider>(_context,listen: false).setAdminLoication(Location,address);
   if(address!=null){
     print(address);
     widget.controller.text='';
   widget.controller.text=address;}
   if( prov.oldMArket!=null)   prov.oldMArket['location']=null;
   setState(() {

   });

    }
}
