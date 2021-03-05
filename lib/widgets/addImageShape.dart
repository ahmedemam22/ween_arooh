import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/text_field.dart';
class AddImageShape extends StatelessWidget {
  final String title;
  final bool addCoupoun;

  const AddImageShape({Key key, this.title, this.addCoupoun=false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween ,
              children: [
                Text(title),
                if(addCoupoun)Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red,

                  ),
                ),
                  child: TextFeld(hintText:'copoun_symbol'),
                )],
            ),
            SizedBox(height: 17,),
            Row(
              children: [
                Image.asset("assets/images/add.png"),


              ],
            )
          ]),
    );
  }
}