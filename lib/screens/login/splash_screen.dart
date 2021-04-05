import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/services/provider/homeProvider.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/widgets/ween_aroh_text_shape.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ween_arooh/model/userModel.dart';
import 'package:ween_arooh/services/provider/userProvider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      _check_savedUser();

    });
    super.initState();


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
  _check_savedUser() {
    SharedPreferences.getInstance().then((pref) {
      // String ids_check =pref.getString("email");
      try {
       if( pref.getString('user')==null){
         Navigator.pushReplacementNamed(context, '/main');
       }
       else{

         Provider.of<UserProvider>(context, listen: false).getUser().then((value) =>Navigator.pushReplacementNamed(context, '/main')
         );
       }

        /* else {
          navigateAndClearStack(context, Log_In());
        }*/
      } catch (error) {
        print('error 888811:: $error');
      }
      ;
    });
  }
}
