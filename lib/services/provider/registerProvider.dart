import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:ween_arooh/network/constant.dart';
import 'package:ween_arooh/network/api.dart';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:provider/provider.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/model/verficationModel.dart';
import 'package:ween_arooh/services/provider/userProvider.dart';
import 'package:ween_arooh/model/userModel.dart';
import 'dart:convert';
class RegisterProvider extends ChangeNotifier{

  bool _waitRegister=false;
  bool get waitRegister=>_waitRegister;
  bool _waitLogin=false;
  bool get waitLogin=>_waitLogin;
  bool _waitResendCode=false;
  bool get waitResendCode=>_waitResendCode;
  File _image;
  File get image=>_image;
  bool _waitVerficationCode=false;
  bool get waitVerficationCode=>_waitVerficationCode;
  VerficationModel _verficationModel;
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
       "mobile":mobile,
       "latitude":"30",
       "longitude":"31",
     });
     print(json.decode(reponse.body));
     if(reponse.statusCode==200){
       Navigator.pushNamed(context, '/login');


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
    print(json.decode(response.body));
    print("sssssssss");
     if(response.statusCode==200){
       _verficationModel= VerficationModel(mobile: mobile,code:json.decode(response.body)['result'] );

  Navigator.pushNamed(context, '/verfication',arguments: _verficationModel);


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
Future<String> resend(mobile)async{
  var response;
  try{
    _waitResendCode=true;
    notifyListeners();
    response= await api.post(BASE_URL+RESEND_CODE,{
      "mobile" : mobile,
    });
  print(json.decode(response.body));

  }
    catch(e){
    print("error resend code::$e");
    }
    finally{
    _waitResendCode=false;
    notifyListeners();
    }
    return json.decode(response.body)['result'].toString();
}
verfiy(context,code)async{
   try {
     _waitVerficationCode=true;
     notifyListeners();
    var response= await api.post(BASE_URL + VERIFY, {
       "mobile": _verficationModel.mobile, // 9 digits
       "code": code, // 4 digits
     });
    if(response.statusCode==200){
      Provider.of<UserProvider>(context,listen: false).setUser(UserModel.fromJson(json.decode(response.body)).result).then((value) => Navigator.pushReplacementNamed(context, '/main'));

    }
    else{
      Dialogs().awsomeDialog(context: context,
          desc: "الكود خطا",
          title: "خطا",
          type: DialogType.ERROR);
    }

    }

   catch(e){
     print("error verfication code::$e");
   }
   finally{
     _waitVerficationCode=false;
     notifyListeners();
   }
}
setUser(){

}



}