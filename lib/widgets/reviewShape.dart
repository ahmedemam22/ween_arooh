import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/rate_shape/rateShape.dart';
import 'package:ween_arooh/model/rateModel.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketDetailsProvider.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
class ReviewShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<ResultElement>_rates=Provider.of<MarketDetailsProvider>(context,listen: false).rates;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: SizeConfig.screenWidth*0.8,
          child: ListView.builder(
          itemCount: _rates.length,
      itemBuilder: (BuildContext context,int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/reviewImage.png"),
                        SizedBox(width: 8,),
                        Column(children: [
                          Text(_rates[index].user.name, style: TextStyle(
                              fontSize: 15,
                            fontWeight: FontWeight.bold

                          ),
                            overflow: TextOverflow.ellipsis,),
                          Text("3 review", style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey
                          )),


                        ],),
                      ],
                    ),


                    Column(
                      children: [
                        Row(
                          children: [
                            RateShape(size: 20,value: _rates[index].rate.toDouble(),),
                            Text("${DateTime.now().year-_rates[index].createdAt.year} years ago"),
                          ],
                        ),

                      ],
                    ),
                  ]),
              SizedBox(height: 23,),

              Text(_rates[index].comment, style: TextStyle(
                  fontSize: 20
              ),),
              Divider()

            ],
          );
      }),
        ),

    );
  }
}
