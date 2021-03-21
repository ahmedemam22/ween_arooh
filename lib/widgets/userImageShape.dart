import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/bottomSheet.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/userProvider.dart';
class UserImageShape extends StatelessWidget {
  final String path;
  UserImageShape({this.path});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showChooses(context);
      },
      child:  Consumer<UserProvider>(
          builder: (context, user, child) {
      return user.user!=null?user.user.imgProfile!=null?Image.file(user.user.imgProfile,
        width: SizeConfig.screenWidth * 0.25,
        height: SizeConfig.screenWidth * 0.25,
        fit: BoxFit.fill,):user.user.path!=null?Image.network(user.user.path,
        width: SizeConfig.screenWidth * 0.25,
        height: SizeConfig.screenWidth * 0.25,
        fit: BoxFit.fill,):Image.asset(
        path ?? "assets/images/user.png",
        scale: 0.8,
        width: SizeConfig.screenWidth * 0.25,
        height: SizeConfig.screenWidth * 0.25,
        fit: BoxFit.fill,
      ):Image.asset(
        path ?? "assets/images/user.png",
        scale: 0.8,
        width: SizeConfig.screenWidth * 0.25,
        height: SizeConfig.screenWidth * 0.25,
        fit: BoxFit.fill,
      );
    }),
    );
  }
}
