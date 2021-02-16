import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:ween_arooh/network/constant.dart';
import 'package:ween_arooh/network/api.dart';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/model/verficationModel.dart';
import 'dart:convert';
class RegisterProvider extends ChangeNotifier{
  bool _waitRegister=false;
  bool get waitRegister=>_waitRegister;
  bool _waitLogin=false;
  bool get waitLogin=>_waitLogin;
  File _image;
  File get image=>_image;
  setImage(image){
    _image=image;
    notifyListeners();
  }
  Future register({String fName,String lName,String mobile,context})async{
   try {
     _waitRegister=true;
     notifyListeners();
     var reponse = await api.post(BASE_URL + REGISTER, {
       "f_name":fName,
       "l_name":lName,
       "mobile":mobile
     });
     if(reponse.statusCode==200){
       Navigator.pushNamed(context, '/verfication',arguments: mobile);


     }
     else{
       Dialogs().awsomeDialog(context:context,type: DialogType.ERROR,title: translator.translate('sorry')
       ,desc: translator.translate('register_error'));



     }

   }
   catch(e){
     print("register error::$e");

   }
   finally{
     _waitRegister=false;

     notifyListeners();
   }
  }
Future login({String mobile,context})async{
   try {
     _waitLogin=true;
     notifyListeners();
    var response= await api.post(BASE_URL + LOGIN, {'mobile': mobile});
     if(response.statusCode==200){
       Navigator.pushNamed(context, '/verfication',arguments: VerficationModel(mobile: mobile,code:json.decode(response.body)['code'] ));


     }
     else{
       Dialogs().awsomeDialog(context:context,type: DialogType.ERROR,title: translator.translate('sorry')
           ,desc: translator.translate('login_error'));



     }
   }
   catch(e){
     print("login error::$e");
   }
   finally{
     _waitLogin=false;
     notifyListeners();
   }
}

}