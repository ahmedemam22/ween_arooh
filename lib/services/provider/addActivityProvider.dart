import 'package:flutter/material.dart';
import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class AddActivityProvider extends ChangeNotifier{
  List<LatLng>_branches=[];
  List<LatLng>get branches=>_branches;
  List<String>_branchesAddress=[];
  List<String>get branchesAddress=>_branchesAddress;
  List<File>_logoImage=[];
  List<File>_bannerImage=[];
  List<File>get logoImage=>_logoImage;
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
  addLogo(File image){
    _logoImage.add(image);
    notifyListeners();
  }
addBranch(latlng,String address){
    _branches.add(latlng);
    _branchesAddress.add(address);
    notifyListeners();
}

  removeBranch(int index){
    _branches.removeAt(index);
    _branchesAddress.removeAt(index);
    notifyListeners();
  }

}