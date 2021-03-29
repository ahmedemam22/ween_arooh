import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/addActivityProvider.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/text_style.dart';
import 'package:ween_arooh/utils/my_padding.dart';
class DescriptionShape extends StatelessWidget {
  final int maxLine;
  final String title;
  final String keyy;
  final  controller;

  const DescriptionShape({Key key, this.maxLine, this.title, this.keyy, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(Provider.of<AddActivityProvider>(context,listen: false).oldMArket!=null){

     controller.text=Provider.of<AddActivityProvider>(context,listen: false).oldMArket[keyy];
    }
    else{
      //controller.text='';
    }

    return     Padding(
      padding:  EdgeInsets.symmetric(vertical:SizeConfig.screenWidth*s14,horizontal: SizeConfig.screenWidth*s10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              title,
              style: TX_STYLE_black_14Point5,
              maxLines: 1,
            ),
          ),

          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 0.5,
          ),
          Expanded(

              child: Container(
         height:maxLine>1?SizeConfig.screenWidth*0.3: SizeConfig.screenWidth*0.1,
                width: SizeConfig.screenWidth * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: Colors.grey),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: Center(
                    child: TextFormField(
    controller: controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,

                      ),
                      validator: (value){
                      if(value.length>0)  Provider.of<AddActivityProvider>(context,listen: false).setData(keyy, value);
                        return null;
                      },

                      style: TX_STYLE_black_14,
                      textAlign: TextAlign.center,
                      maxLines: maxLine,
                    ),
                  ),
                ),
              ),
            ),

        ],
      ),
    );
  }
}