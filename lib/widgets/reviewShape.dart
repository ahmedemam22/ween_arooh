import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/rate_shape/rateShape.dart';
class ReviewShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
                     Text("محمد جمال",style: TextStyle(
                       fontSize: 20
                     ),),
                     Text("3 review",style: TextStyle(
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
                      RateShape(size: 20,),
                      Text("2 years ago"),
                    ],
                  ),

                ],
              ),
         ] ),
          SizedBox(height: 23,),

          Text("ماشاء الله تجد ما تحتاجة من المواد الغذائية",style: TextStyle(
              fontSize: 20
          ),)
        ],
      ),
    );
  }
}
