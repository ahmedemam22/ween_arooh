import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/widgets/ween_aroh_text_shape.dart';

class LoginContainerShape extends StatelessWidget {
  final Color color;
  final String register;
  LoginContainerShape({this.color, this.register});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight/3.2,
      color: color??backgroundColor,
      child:WenArohTextShape(register: register!=null?"register":null,)

    );
  }
}
