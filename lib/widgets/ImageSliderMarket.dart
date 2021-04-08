import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketDetailsProvider.dart';
class ImageSliderMarket extends StatefulWidget {
  @override
  _ImageSliderMarketState createState() => _ImageSliderMarketState();
}

class _ImageSliderMarketState extends State<ImageSliderMarket> {
  int _cur=0;

List<String>_item;
  @override
  Widget build(BuildContext context) {
     _item= Provider.of<MarketDetailsProvider>(context,listen: false)?.getImages()??[];
    return Stack(
      children: [
        CarouselSlider(
            items:List.generate(_item.length!=0?_item.length:1, (index) =>
                FadeInImage.assetNetwork(
                  placeholder: '',
                  image: _item.length!=0?_item[index]??"":"",
                  height: SizeConfig.screenHeight,
                  width: SizeConfig.screenWidth,
                  fit: BoxFit.fill,
                ),
            ),

            options: CarouselOptions(
              onPageChanged: (ind,v){
                setState(() {
                  _cur=ind;
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
          children: List.generate( _item.length, (index) {
            return Expanded(
              child: Container(
                width: 10,
                height: 10,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                decoration: BoxDecoration(shape: BoxShape.circle, color: _cur==index?Colors.white:Colors.grey),
              ),
            );
          }),
        ),
      ),
    );
  }
}
