class ChatModel{
   String message;
   String level;
   String type;
   String user_id;
   String msg_type;
   ChatModel({this.message,this.level,this.type,this.user_id,this.msg_type});
   factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
     message: json["message"],
     level: json["level"],
     type: json["type"],
     user_id: json["user_id"],
     msg_type: json["msg_type"]

   );
   Map<String, dynamic> toJson() => {
     "message": message,
     "type": type,
     "user_id": user_id ,
     "msg_type": msg_type
   };

}