import 'dart:io';

import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/text_field.dart';
import 'package:ween_arooh/utils/selectImage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/addActivityProvider.dart';
class DefaultImageShape extends StatelessWidget {
  final String title;
  final Function onSelectImage;
  final bool logo;

  const DefaultImageShape({Key key, this.title, this.onSelectImage,  this.logo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final image=Provider.of<AddActivityProvider>(context,listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            SizedBox(height: SizeConfig.screenWidth*s17,),

            Row(
              children: [
                InkWell(
                    onTap: (){
                      image.defaultImagesOldMarket(logo);

                      SelectImage().setImage( context,onSelectImage);


                    },child: Image.asset("assets/images/add.png")),
                SizedBox(width: SizeConfig.screenWidth*s20,),

                Expanded(
                  child: Container(
                    height: SizeConfig.screenWidth*s60,
                    child:
                              ClipRRect(

                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                  ),child:Container(
                                  width: SizeConfig.screenWidth*s60,
                                  height:SizeConfig.screenWidth*s60,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(logo?image.oldMArket['logo']:image.oldMArket['panner'],),)))),
                             )



                    ),





              ],

            ),

          ]),
    );
  }
}