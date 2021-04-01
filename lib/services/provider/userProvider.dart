import 'dart:convert';
import 'package:ween_arooh/utils/glopal_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:ween_arooh/model/userModel.dart';
import 'package:ween_arooh/network/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/network/api.dart';
class UserProvider extends ChangeNotifier{
  User _user=User();
  User get user=>_user;
  bool _waitSetting=false;
  bool get waitSetting=>_waitSetting;
  bool _waitAbout=false;
  String about;
  bool get waitAbout=>_waitAbout;
  setImageProfile(image){
    _user.imgProfile=image;
    notifyListeners();

  }
  Future updateProfile(User userModel,context)async {
    if(userModel.fName==GlopalApp.user.fName&&userModel.lName==GlopalApp.user.lName&&userModel.mobile==GlopalApp.user.mobile
    &&_user.imgProfile==null){
      Dialogs().awsomeDialog(context: context,
          type: DialogType.ERROR,
          desc: translator.translate('error_edit_data'),
          title: translator.translate('sorry'));

    }
    else{

  if( _user.imgProfile!=null)  userModel.imgProfile = _user.imgProfile;


    _user.fName = userModel.fName;
    _user.lName = userModel.lName;
    _user.mobile = userModel.mobile;
    _user.name = userModel.fName+" "+userModel.lName;

    Dio dio = Dio();

    FormData formData = FormData.fromMap({
      "user_id": GlopalApp.user.id,
      "f_name": _user.fName,
      "l_name": _user.lName,
  if(_user.mobile!=GlopalApp.user.mobile)  "mobile": _user.mobile,
     if(userModel.imgProfile!=null) "profile_pic": await MultipartFile.fromFile(
          _user.imgProfile.path, filename: "${_user.imgProfile.path
          .split('/')
          .last}"),
    });
    var response;
    try {
      _waitSetting=true;
      notifyListeners();
      response = await dio.post(
        BASE_URL + UPDATE_PROFILE,
        data: formData,
        onSendProgress: (int sent, int total) {
          print('send $sent::$total');
        },
        //  options: Options(headers: {HttpHeaders.authorizationHeader:staticVar.Base_auth})
      );
    }
    catch (e) {
      print("update profile error::$e");
      Dialogs().awsomeDialog(context: context,
          type: DialogType.ERROR,
          desc: translator.translate('general_error'),
          title: translator.translate('sorry'));



    }
    finally {
      await setUser(_user);
      _waitSetting=false;
      notifyListeners();
      Map valueMap = jsonDecode(response.toString());
      if (valueMap['code'] == 200 && valueMap['message'] == 'success') {
        GlopalApp.user.fName=_user.fName;
        GlopalApp.user.lName=_user.lName;
        GlopalApp.user.name=_user.fName+" "+_user.lName;
        GlopalApp.user.mobile=_user.mobile;
        Dialogs().awsomeDialog(context: context,
            type: DialogType.SUCCES,
            desc: translator.translate('update_profile'),
            title: translator.translate('success'));
      }
      else{
        Dialogs().awsomeDialog(context: context,
            type: DialogType.ERROR,
            desc: translator.translate('general_error'),
            title: translator.translate('sorry'));


      }
    }}
  }
Future setUser([User user])async{
   _user=user;
    GlopalApp.user=_user;
    notifyListeners();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = await prefs.setString('user',user==null?null: jsonEncode(user));
     prefs.setString('token', user==null?null:GlopalApp.token);


}
Future getUser()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  Map<String, dynamic> userMap;
  final String userStr = prefs.getString('user');
  if (userStr != null) {
    userMap = jsonDecode(userStr) as Map<String, dynamic>;

    if (userMap != null) {
      final User user = User.fromJson(userMap);
      _user=user;
      GlopalApp.user=_user;
      print(_user.id);
      print('idddddddddddddddd');
      GlopalApp.token=prefs.getString('token');
      print('glopaaaaaaaaaaaaal');
      print(GlopalApp.token);
    }

  }
  notifyListeners();
}
Future aboutUs()async{
   try {
     _waitAbout=true;
     var response=await api.get(BASE_URL + ABOUT);
     about=translator.currentLanguage=='ar'?response['result'][0]['text_ar']:response['result'][0]['text_en'];

}
catch(e){
     print('about us error $e');
}
finally{
  _waitAbout=false;
  notifyListeners();

}
}
}