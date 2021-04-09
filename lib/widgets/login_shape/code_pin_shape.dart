import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class CodePinShape extends StatelessWidget {
  final controller;

  const CodePinShape({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        width: SizeConfig.screenWidth *0.8,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: PinCodeTextField(
            controller: controller,
            textInputType: TextInputType.phone,
        //    controller: _pinCodeController,
            length: 4,
            obsecureText: false,
            animationType: AnimationType.fade,
            animationDuration: Duration(milliseconds: 300),
            enableActiveFill: true,
            backgroundColor: white,
            textStyle: TextStyle(color: black, fontSize: SizeConfig.fontSize16),
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.underline,
//            borderRadius: BorderRadius.circular(12),
              activeColor: darkBlue,
              inactiveColor: lightBlue,
              activeFillColor: white,
              fieldHeight: 50,
              fieldWidth: SizeConfig.screenWidth/8,
              disabledColor: darkBlue,
              inactiveFillColor: white,
              selectedFillColor: lightBlue,
              selectedColor: darkBlue,
            ),
            /*onChanged: (value) {
              setState(() {
//                            currentText = value;
              });
            },*/
          ),
        ),
      ),
    );
  }
}
