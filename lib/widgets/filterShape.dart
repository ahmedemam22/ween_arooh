import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ween_arooh/services/provider/marketProvider.dart';
class FilterShape extends StatefulWidget {
  @override
  _FilterShapeState createState() => _FilterShapeState();
}

class _FilterShapeState extends State<FilterShape> {
  int _current;
  @override
  Widget build(BuildContext context) {
    final _marketProvider=Provider.of<MarketProvider>(context,listen: false);
    return Card(
      elevation: 5,
      child: Container(
        width: SizeConfig.screenWidth,
        color: veryLightBlue,
        child:  Row(
            children: [
              InkWell(
                  onTap: (){
                    _marketProvider.filterByChars();
                    setState(() {
                      _current=0;
                    });

                  },
                  child: filterShape(translator.translate('sort_by_alpha'), 'ic_sort',0,false)),
          InkWell(
              onTap: (){
                _marketProvider.filterByLocation();
                setState(() {
                  _current=1;
                });

              },child: filterShape(translator.translate('sort_by_location'), 'ic_location',1)),
              InkWell(
                  onTap: (){
                    _marketProvider.filterByLocation();
                    setState(() {
                      _current=2;
                    });

                  },child: filterShape(translator.translate('sort_by_region'), 'location1',2)),
              InkWell(
                  onTap: (){
                    _marketProvider.filterByRate();
                    setState(() {
                      _current=3;
                    });

                  },child: filterShape(translator.translate('sort_by_rate'), 'star',3)),

            ],
          ),
        ),

    );
  }

 Widget filterShape(String title,String iconName,int index,[split=true]){
    return Padding(
        padding:  EdgeInsets.symmetric(horizontal:0,vertical: SizeConfig.screenWidth*s10),
        child: Row(
          children: [
           if(split) Padding(
              padding:  EdgeInsets.symmetric(horizontal:4),
              child: Container(
                color: Colors.white,
                width: SizeConfig.screenWidth*s2,
                height:  SizeConfig.screenWidth*s25,
              ),
            ),

            SvgPicture.asset(



              "assets/images/$iconName.svg",
              color: _current==index?backgroundColor:darkGrey,
            ),
            SizedBox(width: 3,),

            Expanded(
              flex: 0,
              child: Text(title,style: TextStyle(

                fontSize: SizeConfig.screenWidth*s11,
                    fontWeight: FontWeight.bold
                    ,color: _current==index?backgroundColor:darkGrey
              ),
              ),
            ),

          ],
        ),

    );
  }
}
