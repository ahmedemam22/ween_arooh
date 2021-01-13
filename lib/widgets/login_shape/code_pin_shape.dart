import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class CodePinShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        width: SizeConfig.screenWidth *0.8,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: PinCodeTextField(
            textInputType: TextInputType.numberWithOptions(),
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
              activeColor: dark_blue,
              inactiveColor: light_blue,
              activeFillColor: white,
              fieldHeight: 50,
              fieldWidth: SizeConfig.screenWidth/8,
              disabledColor: dark_blue,
              inactiveFillColor: white,
              selectedFillColor: light_blue,
              selectedColor: dark_blue,
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
