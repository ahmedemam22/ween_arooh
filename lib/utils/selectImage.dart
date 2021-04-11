import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/addActivityProvider.dart';
import 'dart:io';
import 'package:ween_arooh/services/provider/registerProvider.dart';
class SelectImage{
  Future getImage(source,context) async {
    final pickedFile = await ImagePicker.pickImage(source: source);
    Provider.of<RegisterProvider>(context,listen: false).setImage( pickedFile);
    Navigator.pop(context);


  }
  Future setImage(context,Function add) async {
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    add(pickedFile);



  }

}
