import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class CommonAlertRFlutter {


  static alertWithWidgets(context,
      {String title,
        String url,
        Color titleTextColor,
        String desc,
        List<DialogButton> buttons,
        AlertType alertType,
        Widget content}) =>
      Alert(
          type: alertType,
          style: AlertStyle(
              isCloseButton: false,
              descStyle: TextStyle(fontSize: 2.0, color: titleTextColor ?? Colors.black),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width)),
          context: context,
          content: show_image(url),
          title: title ?? '',
          buttons: buttons)
          .show();
  static Widget  show_image(url){
    return Container(
      height: SizeConfig.screenWidth  /3,
      width: SizeConfig.screenWidth / 1.5 ,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
              image: NetworkImage(
                url,
              ),
              fit: BoxFit.contain)),
      child: Container(),
    );

  }

}
