//valdation

import 'package:localize_and_translate/localize_and_translate.dart';

//////////////////////////////////////////////////////////////////
String fnValidEmail(String email) {
  print('email is $email');
  if ((email == null) || email.length < 3) {
    return translator.currentLanguage == 'en' ? 'enter valid email' : "ادخل بريد الكتروني صحيح";
    // return 'enter valid email';
  } else if (RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$").hasMatch(email) != true) {
    return 'ex@gmail.com';
  } else {
    return null;
  }
}

String fnValidName(String name) {
  if ((name == null) || name.length < 3) {
    return    translator.currentLanguage == 'en' ? 'name must\'t be less than 3 char ' : "الاسم لايقل عن 3 احرف";

  } /*else if (RegExp(r"^(?=.{1,40}$)[a-zA-Z]+(?:[-'\s][a-zA-Z]+)*$").hasMatch(name) != true) {
    return 'name only text';
  }*/ else {
    return null;
  }
}

String fnValidPhone(String phone) {
  if (phone == null||phone.length!=9 ) {
    return   translator.currentLanguage == 'en' ? '"mobile number must be 9 digits" ' : "رقم الهاتف يجب ان يكون 9 ارقام";


  } else {
    return null;
  }
}

String fnValidPass(String password) {
  if (password == null || password == '' || password.length < 8) {
    return translator.currentLanguage == 'en' ? "password is very short " : "الرقم السري قصير جدا";
    // return "password is very short ";
  } else {
    return null;
  }
}

String fnValidConfPass(String confPassword, String password) {
  if (confPassword == null || confPassword == "" || password != confPassword) {
    return "doesn't match the password ";
  } else {
    return null;
  }

}
String fnEmpty(String value) {
  if (value.isEmpty) {
    return translator.translate('add_data');
  } else {
    return null;
  }
}
