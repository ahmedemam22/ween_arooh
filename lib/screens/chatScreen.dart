import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/chat_shape/chatFooter.dart';
import 'package:ween_arooh/widgets/chat_shape/chatShape.dart';
import 'package:ween_arooh/widgets/drawer.dart';
import 'package:ween_arooh/widgets/appBarShape.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/chatProvider.dart';
class ChatScreen extends StatelessWidget {
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>(); // ADD THIS LINE

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
          key: _scaffoldKey,
          drawer: AppDrawer(),
      body: Column(children: [
      AppBarShape(title:translator.translate('contact_us'),openDrawer: _scaffoldKey,),
    SizedBox(height:SizeConfig.screenWidth*s8),
        Expanded(
          flex: 10,
          child:  Consumer<ChatProvider>(
    builder: (context, chat, child) {
      return
        ListView.builder(
            itemCount: chat.allMessages.length,
            itemBuilder: (context, i) {
              return ChatShape(chat.allMessages[i]);
            });
    }   )
        ),
      Expanded(
        child: ChatFooter(),
      )

      ]));
  }
}
