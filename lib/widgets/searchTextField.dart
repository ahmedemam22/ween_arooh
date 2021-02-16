import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(

      decoration: new InputDecoration(
        border: new OutlineInputBorder(

          borderRadius:  BorderRadius.all(
            Radius.circular(SizeConfig.screenWidth*s30),
          ),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.search),



      ),
    );
  }
}
