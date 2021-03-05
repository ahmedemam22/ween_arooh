import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:ween_arooh/model/userModel.dart';
import 'package:ween_arooh/network/constant.dart';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
class UserProvider extends ChangeNotifier{
  UserModel _user=UserModel();
  UserModel get user=>_user;
  bool _waitSetting=false;
  bool get waitSetting=>_waitSetting;
  setImageProfile(image){
    _user.imgProfile=image;
    notifyListeners();

  }
  Future updateProfile(UserModel userModel,context)async {
    userModel.imgProfile = _user.imgProfile;
    _user = userModel;
    Dio dio = Dio();

    FormData formData = FormData.fromMap({
      "user_id": "2",
      "f_name": _user.fName,
      "l_name": _user.lName,
      "mobile": _user.mobile,
      "profile_pic": await MultipartFile.fromFile(
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
    }
    finally {
      _waitSetting=false;
      notifyListeners();
      Map valueMap = jsonDecode(response.toString());
      if (valueMap['code'] == 200 && valueMap['message'] == 'success') {
        Dialogs().awsomeDialog(context: context,
            type: DialogType.SUCCES,
            desc: translator.translate('update_profile'),
            title: translator.translate('success'));
      }
    }
  }}