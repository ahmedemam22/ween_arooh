import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/rate_shape/rateShape.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/widgets/text_field.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/widgets/button_shape.dart';
class AddRateShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: SizeConfig.screenWidth*s20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.all(Radius.circular(5))

            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:5.0,vertical: 4),
              child: Text("ادخل التقييم",style: TextStyle(
                fontSize: SizeConfig.screenWidth*s21
              ),),
            ),
          ),
          SizedBox(height: 5,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))

            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth*s15,vertical: SizeConfig.screenWidth*s5),
              child: RateShape(size: SizeConfig.screenWidth*s30,),
            ),
          ),
          SizedBox(height: SizeConfig.screenWidth*s80,),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.all(Radius.circular(5))

            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:5.0,vertical: 4),
              child: Text("اكتب تعليق",style: TextStyle(
                  fontSize: SizeConfig.screenWidth*s21
              ),),
            ),
          ),
          SizedBox(height: SizeConfig.screenWidth*s10,),
          Container(
            color: Colors.white,
            height: SizeConfig.screenWidth*s165,
            width: SizeConfig.screenWidth*200,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFeld()),
          ),
          Container(
            height: SizeConfig.screenWidth*s70,
              width: SizeConfig.screenWidth*s165,

              child: ButtonShape("ارسال",backgroundColor))


        ],
      ),
    );
  }
}
