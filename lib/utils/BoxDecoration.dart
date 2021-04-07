import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/text_style.dart';

class Style{

  static BoxDecoration BoxDecoration1= BoxDecoration(
    border: Border(
      bottom: BorderSide(width: 1.0, color: const Color(0xffaaaaaa)),
    ),
  );

  static InputDecoration InputDecoration1=InputDecoration(
  hintText: '',
  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  isDense: true,
  );

  static Container continer=Container(
    width: SizeConfig.screenWidth,
    height: 1,
    color: Colors.black12,
    margin: const EdgeInsets.fromLTRB(0,0,0,10),
  );

  static TextStyle TextStyle1= TX_STYLE_black_14Point5;
}