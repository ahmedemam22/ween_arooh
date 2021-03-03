import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
class DisplayOffersShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenWidth*s70,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth*s22),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
            Text(translator.translate('offers')),
            SizedBox(height: 5,),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i){

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal:3.0),
                      child: Image.asset('assets/images/offers.png',width:SizeConfig.screenWidth*s47,height: SizeConfig.screenWidth*s51,fit: BoxFit.fill,),
                    );
                  }

              ),
            ),
          ],
        ),
      ),
    );
  }
}
