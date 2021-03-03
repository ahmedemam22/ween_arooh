import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketProvider.dart';
class FilterShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _marketProvider=Provider.of<MarketProvider>(context,listen: false);
    return Container(
      color: filterColor,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth*s10),
        child: Row(
          children: [
            InkWell(
                onTap: (){
                  _marketProvider.filterByChars();

                },
                child: filterShape(translator.translate('sort_by_alpha'), Icons.sort_by_alpha)),
        InkWell(
            onTap: (){
              _marketProvider.filterByLocation();

            },child: filterShape(translator.translate('sort_by_location'), Icons.location_on_outlined)),
            InkWell(
                onTap: (){
                  _marketProvider.filterByLocation();

                },child: filterShape(translator.translate('sort_by_region'), Icons.location_city_sharp)),
            InkWell(
                onTap: (){
                  _marketProvider.filterByRate();

                },child: filterShape(translator.translate('sort_by_rate'), Icons.star)),

          ],
        ),
      ),
    );
  }
 Widget filterShape(String title,IconData icon){
    return Padding(
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

    );
  }
}
