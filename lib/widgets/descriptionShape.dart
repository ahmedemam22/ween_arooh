import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/text_style.dart';
import 'package:ween_arooh/utils/my_padding.dart';
class DescriptionShape extends StatelessWidget {
  final int maxLine;
  final String title;

  const DescriptionShape({Key key, this.maxLine, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return     Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
          title,
            style: TX_STYLE_black_14Point5,
            maxLines: 1,
          ),
        ),
        
        SizedBox(
          width: SizeConfig.safeAreaVertical * 0.5,
        ),
        Expanded(
          child: Card(
            child: Container(
//          height: SizeConfig.screenWidth*0.6,
              width: SizeConfig.screenWidth * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.5, color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),

                child: Center(
                  child: TextField(
                    onChanged: (value){
                    },
                    decoration: InputDecoration(
                      hintText: translator.currentLanguage == "en" ? "enter your notes" : "ادخل الملاحظات",
                      hintStyle: TX_STYLE_black_14.copyWith(color: Colors.grey),
                    ),
                    style: TX_STYLE_black_14,
                    textAlign: TextAlign.center,
                    maxLines: maxLine,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
