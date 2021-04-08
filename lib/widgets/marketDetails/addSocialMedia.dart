import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/dropDown.dart';
import 'package:ween_arooh/widgets/text_field.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/addActivityProvider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ween_arooh/utils/text_style.dart';
class AddSocialMedia extends StatelessWidget {
  TextEditingController _faceCon=TextEditingController();
  TextEditingController _twitterCon=TextEditingController();
  TextEditingController _linkedCon=TextEditingController();
  TextEditingController _youtubeCon=TextEditingController();
   BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context=context;
    return Padding(
      padding:  EdgeInsets.symmetric(vertical:8.0),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(translator.translate('social_media')),
           shape('facebook', _faceCon, 'facebook'),
           shape('youtube', _youtubeCon, 'youtube'),
           shape('linkedin', _linkedCon, 'linkedin'),
           shape('twitter', _twitterCon, 'twitter'),
            SizedBox(height: 15,)


          ],
        ),
      ),
    );
  }
  shape(String title,con,key,){
    return Padding(
      padding:  EdgeInsets.only(top:SizeConfig.screenWidth*s10),
      child: Row(
        children: [


          SizedBox(width: 8,),

          Expanded(
            child: Text(translator.translate(title),
              style: TX_STYLE_black_15,

            ),
          ),

          TextFeld(controller: con,keyy: key,),


        ],
      ),
    );

  }
  textField(con,key){
    Container(
      width: SizeConfig.screenWidth * 0.58,

      child: TextFormField(
        controller: con,
        validator: (v) {

        if (con.text.toString().length > 0) Provider.of<AddActivityProvider>(_context,listen: false).setData(key, con.text);
        }
        ,
        style: TX_STYLE_black_14.copyWith(fontFamily: 'Schelyer'),


        keyboardType:
             TextInputType.name,


        // style: mobileResult == null ? TX_STYLE_black_14Point5.copyWith(color: gray,fontFamily: 'Schelyer') : TX_STYLE_black_14Point5.copyWith(color: red,fontFamily: 'Schelyer'),
        decoration: InputDecoration(
          hintStyle: TX_STYLE_black_14.copyWith(
              fontFamily: 'Schelyer', fontWeight: FontWeight.normal),

          //  hintStyle: mobileResult == null ? TX_STYLE_black_14Point5.copyWith(color: gray) : TX_STYLE_black_14Point5.copyWith(color: red),

        ),
      ),

    );
  }
}
