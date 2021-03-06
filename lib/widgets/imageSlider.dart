import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ImageSlider extends StatelessWidget {





  List<String> imgs=['assets/images/imageSlider2.png','assets/images/imageSlider1.png','assets/images/imageSlider2.png'];


  @override
  Widget build(BuildContext context) {
    return
    CarouselSlider(
    items: imgs.map(
    (url) {
      return
    Container(
          height: MediaQuery.of(context).size.height * 10,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            child: Image.asset(
              url,
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              fit: BoxFit.fill,
            ),
            // child: Image.network(url, fit: BoxFit.cover, width: 1000.0,height: 30,),
          ),

      );
    },
    ).toList(),
    options: CarouselOptions(
    height: SizeConfig.screenWidth*s175,
    aspectRatio: 16/9,
    viewportFraction: 0.7,
    initialPage: 0,
    enableInfiniteScroll: true,
    reverse: false,
    autoPlay: true,
    autoPlayInterval: Duration(seconds: 3),
    autoPlayAnimationDuration: Duration(milliseconds: 800),
    autoPlayCurve: Curves.fastOutSlowIn,
    enlargeCenterPage: true,
    scrollDirection: Axis.horizontal,
    )
     // display the images


    );
  }







}