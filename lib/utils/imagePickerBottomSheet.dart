import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/selectImage.dart';
import 'package:image_picker/image_picker.dart';

showChooses(BuildContext context)
{
  showModalBottomSheet(context: context, builder: (context){
    return Container(
      padding: EdgeInsets.all(10.5),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          OutlineButton(
            borderSide: BorderSide(width: 0.0),
            onPressed: ()=>SelectImage().getImage(ImageSource.camera,context),//_getImage(context,ImageSource.camera),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.camera,color: Colors.amber,),
                Padding(
                  padding: const EdgeInsets.only(top:5.0),
                  child: Text('Camera'),
                ),
              ],),
          ),
          SizedBox(width: 50,),
          OutlineButton(
            borderSide: BorderSide(width: 0.0),
            onPressed: ()=>SelectImage().getImage(ImageSource.gallery,context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.image,color: Colors.deepPurple,),
                Padding(
                  padding: const EdgeInsets.only(top:5.0),
                  child: Text('Gallary'),
                ),
              ],),
          )
        ],
      ),
    );
  });
}