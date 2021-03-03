import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/widgets/rate_shape/rateShape.dart';
import 'package:ween_arooh/model/marketModel.dart';
class MarketsShape extends StatelessWidget {
  Result _market;
  final int _index;
  MarketsShape(this._market, this._index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/display_image',arguments:_index);
      },
      child: Container(
          height: MediaQuery.of(context).size.height * 0.4, // ignore this, cos I am giving height to the container
          width: MediaQuery.of(context).size.width * 0.5, // ignore this, cos I am giving width to the container
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(_market.panner,

                  )
              )
          ),
          alignment: Alignment.bottomCenter, // This aligns the child of the container
          child: Padding(
              padding: EdgeInsets.only(bottom: 10.0), //some spacing to the child from bottom
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                children: [
                  Text('10 Km', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  RateShape(size: 20,)
                ],
              )
          )
      ),
    );
  }
}
