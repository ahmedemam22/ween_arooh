import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/appBarShape.dart';
class OffersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Column(
        children: [
          AppBarShape(translator.translate('offers')),
          Expanded(
            child: GridView.builder(
              padding:  EdgeInsets.fromLTRB(SizeConfig.screenWidth*s30,SizeConfig.screenWidth*s17,SizeConfig.screenWidth*s30
              ,0),
              itemCount: 5,
              itemBuilder: (ctx, i) =>Container(
                width:  SizeConfig.screenWidth*s165,
                height:  SizeConfig.screenWidth*(s200+s36),
                child: Image.asset('assets/images/offers.png'
                ,width:  SizeConfig.screenWidth*s165,
                fit: BoxFit.fill,
                height:  SizeConfig.screenWidth*(s200+s200),
                ),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: SizeConfig.screenWidth/30,
                crossAxisSpacing: SizeConfig.screenWidth*s18


              ),
            ),
          ),

        ],
      ),
    );
  }
}
