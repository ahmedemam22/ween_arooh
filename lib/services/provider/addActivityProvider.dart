import 'package:flutter/material.dart';
class AddActivityProvider extends ChangeNotifier{
  Map<String,dynamic>_data;
  setData(String key,value){
    if(_data.containsKey(key)){

      _data.update(key, (value) => value);
    }
    else{
      _data.putIfAbsent(key, () =>
      value
      );}
    notifyListeners();

  }

}