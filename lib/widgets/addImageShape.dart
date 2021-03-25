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
class AddImageShape extends StatelessWidget {
  final String title;
  final bool addCoupoun;
  final Function onSelectImage;
  final Function onRemoveImage;
  final List<File>images;

  const AddImageShape({Key key, this.title, this.addCoupoun=false, this.onSelectImage, this.images, this.onRemoveImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween ,
              children: [
                Expanded(child: Text(title)),
              /*  if(addCoupoun)Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red,

                  ),
                ),
                  child: TextFeld(hintText:'copoun_symbol'),
                )*/

              ],
            ),
            SizedBox(height: SizeConfig.screenWidth*s17,),

      Row(
                children: [
                  InkWell(
                      onTap: (){
                        SelectImage().setImage( context,onSelectImage);

                      },child: Image.asset("assets/images/add.png")),
                        SizedBox(width: SizeConfig.screenWidth*s20,),

                        Expanded(
                          child: Container(
                            height: SizeConfig.screenWidth*s60,
                            child: ListView.builder(
                              shrinkWrap: true,

                              scrollDirection: Axis.horizontal,
                              itemCount: images.length,
                              itemBuilder: (context, i) {
                                return  Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                                  child: Stack(

                                    children: [
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
                                          image: FileImage(images[i],))))),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: InkWell(

                                            child: Icon(Icons.close,color: Colors.red,size: SizeConfig.screenWidth*s20,),
                                        onTap: (){
                                             onRemoveImage(i);

                                        },
                                        ),
                                      ),
                                    ],
                                  ),
                                );


                              },
                            ),
                          ),
                        )



                ],

              ),

          ]),
    );
  }
}