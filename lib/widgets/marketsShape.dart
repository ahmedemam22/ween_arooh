import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/rate_shape/rateShape.dart';
import 'package:ween_arooh/model/marketModel.dart';
import 'package:ween_arooh/utils/size_config.dart';
class MarketsShape extends StatelessWidget {
  Market _market;
  final int _index;
  MarketsShape(this._market, this._index);

  @override
  Widget build(BuildContext context) {
    print(_market.distance);
    print('distaaaaaaaaaaance');
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/market_details',arguments: _market.id);
      },
      child:
    Column(
      children: [
        Container(
          width:  SizeConfig.screenWidth * 0.5,
          height: SizeConfig.screenHeight/3,

          child: Stack(
                    children: <Widget>[
               FadeInImage.assetNetwork(
               placeholder:"assets/images/image_market.jpg",
                 fit: BoxFit.fill,
                 image: _market.panner??"",


                 width:  SizeConfig.screenWidth * 0.5,
                 height: SizeConfig.screenHeight/2,),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child:Padding(
                          padding: EdgeInsets.only(bottom: 10.0), //some spacing to the child from bottom
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                            children: [
                              Text('${_market.distance.toStringAsFixed(0)} Km', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                                  fontFamily: 'Schelyer')),
                              RateShape(size: 20,value: _market.rate.toDouble(),)
                            ],
                          )
                      )),
                    ]
                ),
        ),
        SizedBox(height: 5,),
        Expanded(child: Text(_market.title))
      ],
    ) // This aligns the child of the container


    );
  }
}
/*FadeInImage.assetNetwork(
                        placeholder:"assets/images/offers.jpg",
                        fit: BoxFit.fill,
                        image: offers.offersItems[i].panner??"",


                        width:  SizeConfig.screenWidth * s165,
                        height: SizeConfig.screenHeight/3,),*/