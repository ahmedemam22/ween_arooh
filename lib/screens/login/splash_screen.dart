import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/widgets/ween_aroh_text_shape.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/register');
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        color: backgroundColor,

        child: Padding(
          padding:  EdgeInsets.only(top:SizeConfig.screenWidth*s175),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo_icon.png",
                width: SizeConfig.screenWidth*(s130+s18),
                height: SizeConfig.screenWidth*(s165),

              ),
              WenArohTextShape()

            ],
          ),
        ),
      ),
    );
  }
}
