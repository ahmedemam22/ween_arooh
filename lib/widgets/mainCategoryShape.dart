import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/model/mainCategoryResponse.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketDetailsProvider.dart';
class MainCategoryShape extends StatelessWidget {
  final  Result item;

  const MainCategoryShape({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          Provider.of<MarketDetailsProvider>(context,listen: false).selectId(item.id);
          Navigator.pushNamed(context, '/markets',arguments: translator.currentLanguage=='ar'?item.nameAr:item.nameEn);

        },
        child: Column(
          children: [
          FadeInImage.assetNetwork(
          placeholder:"assets/images/ic_call.png",
          image: item.path??"",


            width: SizeConfig.screenWidth*s43,
            height: SizeConfig.screenWidth*s38,),
            SizedBox(height:SizeConfig.screenWidth*s5),

            Expanded(
              child: Text(translator.currentLanguage=='en'?item.nameEn:item.nameAr,style: TextStyle(
                fontSize: SizeConfig.screenWidth*s20,
                color: categoryColor
              ),),
            )
          ],
        ),
      ),
    );
  }
}
