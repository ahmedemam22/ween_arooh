import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/chat_shape/chatFooter.dart';
import 'package:ween_arooh/widgets/chat_shape/chatShape.dart';
import 'package:ween_arooh/widgets/drawer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/chatProvider.dart';
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
   @override
  void initState() {
     Provider.of<ChatProvider>(context,listen: false).getMessages().then((value) => null);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor,

            title: Center(child: Text(translator.translate('contact_us'))),
          ),
            key: _scaffoldKey,
            drawer: AppDrawer(),
        body: Column(children: [
      SizedBox(height:SizeConfig.screenWidth*s8),
          Expanded(
            flex: 10,
            child:  Consumer<ChatProvider>(
      builder: (context, chat, child) {
        return chat.waitMessage?Center(child: CircularProgressIndicator(),):
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

        ])),
    );
  }
}
