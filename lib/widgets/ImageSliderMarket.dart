import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
class ImageSliderMarket extends StatefulWidget {
  @override
  _ImageSliderMarketState createState() => _ImageSliderMarketState();
}

class _ImageSliderMarketState extends State<ImageSliderMarket> {
  int cur=0;
  var items=[
    Image.asset( "assets/images/imageSlider1.png",fit: BoxFit.cover,),
    Image.asset( "assets/images/imageSlider1.png",fit: BoxFit.cover,),
    Image.asset( "assets/images/imageSlider1.png",fit: BoxFit.cover,),
    Image.asset( "assets/images/imageSlider1.png",fit: BoxFit.cover,),
    Image.asset( "assets/images/imageSlider1.png",fit: BoxFit.cover,),
    Image.asset( "assets/images/imageSlider1.png",fit: BoxFit.cover,),

  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
            items:items,

            options: CarouselOptions(
              onPageChanged: (ind,v){
                setState(() {
                  cur=ind;
                });

              },

              autoPlay: true,
              viewportFraction: 1,
              height: SizeConfig.screenWidth*s175,



              //aspectRatio: //MediaQuery.of(mediaContext).size.aspectRatio,

            )
        ),
        indicatorShape()

      ],
    );
  }

  indicatorShape(){
    return  Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: Container(
//          color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: List.generate(items.length, (index) {
            return Container(
              width: 10,
              height: 10,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              decoration: BoxDecoration(shape: BoxShape.circle, color: cur==index?Colors.white:Colors.grey),
            );
          }),
        ),
      ),
    );
  }
}
