import 'package:flutter/material.dart';
import 'dart:io';
class AddActivityProvider extends ChangeNotifier{
  List<File>_bannerImage=[];
  List<File>get bannerImage=>_bannerImage;
  List<File>_offerImage=[];
  List<File>get offerImage=>_offerImage;
  List<File>_couponImage=[];
  List<File>get copounImage=>_couponImage;
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
  addImageBanner(File image){
    _bannerImage.add(image);
    notifyListeners();

  }
  addOffers(File image){
    _offerImage.add(image);
    notifyListeners();

  }
  addCopoun(File image){
    _couponImage.add(image);
    notifyListeners();
  }


}