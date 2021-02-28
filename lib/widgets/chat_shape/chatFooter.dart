import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/dialogs.dart';
class ChatFooter extends StatelessWidget {
  TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight/10,
        decoration: BoxDecoration(
          border: Border(
        top: BorderSide( //                   <--- left side
        color: Colors.grey,
        width: 1.0,

        ))),

        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth*s14),
          child: Row(
            children: [
              InkWell(
                  onTap: (){
                    Dialogs().discount(context);
                  },
                  child: Icon(Icons.attach_file,)),
              SizedBox(width: SizeConfig.screenWidth*s15,),

              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      hintText: translator.currentLanguage == "en" ? "Type a message" : "اكتب رسالتك",
                      border: InputBorder.none),

                ),
              ),

              InkWell(
                  onTap: (){
                    _controller.text="";
                  },


                  child: ImageIcon(AssetImage("assets/images/ic_send.png",),color: backgroundColor,)),

            ],
          ),
        ),

    );
  }
}
