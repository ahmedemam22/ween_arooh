import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/homeProvider.dart';
class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (title){
        Provider.of<HomeProvider>(context,listen: false).makeSearch(title);
      },

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
