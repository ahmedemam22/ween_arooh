import 'package:flutter/cupertino.dart';
import 'package:ween_arooh/network/api.dart';
import 'package:ween_arooh/network/constant.dart';
import 'package:ween_arooh/model/chatModel.dart';
class ChatProvider extends ChangeNotifier{
  bool _waitMessage=false;
  bool get waitMessage=>_waitMessage;
  List<ChatModel>_allMessages=[];
  List<ChatModel>get allMessages=>_allMessages;
  getMessages()async{
   try{
     _waitMessage=true;
     notifyListeners();
     var response= await api.get(BASE_URL+GET_MESSAGE+"1");
   }
     catch(e){
     print("get message error::$e");
   }
   finally{
     _waitMessage=false;
     notifyListeners();
   }

  }
  sendMessages(String msg)async{
    _allMessages.add(ChatModel(message:msg, type: "",msg_type: "text",user_id: "1"));
    notifyListeners();
   try{ await api.post(BASE_URL+SEND_MESSAGE+"",ChatModel(message:msg, type: "",msg_type: "text",user_id: "1").toJson()
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