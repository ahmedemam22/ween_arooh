import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class FilterShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: filterColor,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth*s10),
        child: Row(
          children: [
            filterShape(translator.translate('sort_by_alpha'), Icons.sort_by_alpha),
            filterShape(translator.translate('sort_by_location'), Icons.location_on_outlined),
            filterShape(translator.translate('sort_by_region'), Icons.location_city_sharp),
            filterShape(translator.translate('sort_by_rate'), Icons.star),

          ],
        ),
      ),
    );
  }
  filterShape(String title,IconData icon){
    return Expanded(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:0,vertical: SizeConfig.screenWidth*s10),
        child: Row(
          children: [
            Expanded(
              flex: 0,
              child: Text(title,style: TextStyle(

                fontSize: SizeConfig.screenWidth*s12
              ),
              ),
            ),
         Icon(icon,size: SizeConfig.screenWidth*s20,),
          ],
        ),
      ),
    );
  }
}
