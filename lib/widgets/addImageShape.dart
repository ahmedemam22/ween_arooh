import 'dart:io';

import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/text_field.dart';
import 'package:ween_arooh/utils/selectImage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/addActivityProvider.dart';
class AddImageShape extends StatelessWidget {
  final String title;
  final bool addCoupoun;
  final Function onSelectImage;
  final List<File>images;

  const AddImageShape({Key key, this.title, this.addCoupoun=false, this.onSelectImage, this.images}) : super(key: key);
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
                Text(title),
                if(addCoupoun)Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red,

                  ),
                ),
                  child: TextFeld(hintText:'copoun_symbol'),
                )],
            ),
            SizedBox(height: 17,),
            InkWell(
              onTap: (){
                SelectImage().setImage( context,onSelectImage);

              },
              child: Row(
                children: [
                  Image.asset("assets/images/add.png"),

                        Expanded(
                          child: Container(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: images.length,
                              itemBuilder: (context, i) {
                                return Image.file(images[i],width: 50,height: 50,);


                              },
                            ),
                          ),
                        )



                ],

              ),
            ),
          ]),
    );
  }
}