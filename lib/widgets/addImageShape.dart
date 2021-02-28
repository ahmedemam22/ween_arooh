import 'package:flutter/material.dart';
class AddImageShape extends StatelessWidget {
  final String title;

  const AddImageShape({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Text(title),
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