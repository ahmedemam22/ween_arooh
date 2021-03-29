import 'package:flutter/cupertino.dart';
import 'package:ween_arooh/network/api.dart';
import 'package:ween_arooh/network/constant.dart';
import 'package:ween_arooh/model/chatModel.dart';
import 'package:ween_arooh/utils/glopal_app.dart';
class ChatProvider extends ChangeNotifier{
  bool _waitMessage=false;
  bool get waitMessage=>_waitMessage;
  List<ChatModel>_allMessages=[];
  List<ChatModel>get allMessages=>_allMessages;
  Future getMessages()async{
   try{
     _waitMessage=true;
     notifyListeners();
     var response= await api.get(BASE_URL+GET_MESSAGE+GlopalApp.user.id.toString());
     for(int i=0;i<response['result'].length;i++){
     _allMessages.add(ChatModel.fromJson(response['result'][i]));
   }}
     catch(e){
     print("get message error::$e");
   }
   finally{
     _waitMessage=false;
     notifyListeners();
   }

  }
  sendMessages(String msg)async{
    _allMessages.add(ChatModel(message:msg, type: 1,msg_type: "text",user_id:GlopalApp.user.id.toString()));
    notifyListeners();
   try{ await api.post(BASE_URL+SEND_MESSAGE+"",ChatModel(message:msg, type:1,msg_type: '1',user_id: GlopalApp.user.id.toString()).toJson()
    );

  }
  catch(e){
     print("send message error ::$e");
  }
  finally{
     notifyListeners();
  }
  }

}