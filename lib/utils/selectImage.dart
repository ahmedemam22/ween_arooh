import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:ween_arooh/services/provider/registerProvider.dart';
class SelectImage{
  Future getImage(source,context) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    Provider.of<RegisterProvider>(context,listen: false).setImage( File(pickedFile.path));
    Navigator.pop(context);


  }
}
