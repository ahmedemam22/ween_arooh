import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:ween_arooh/network/api.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ween_arooh/network/constant.dart';
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
  Map<String,dynamic>_data={};
  bool _waitAddActivity=false;
  bool get waitAddActivity=>_waitAddActivity;
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

  removeBranch(int index) {
    _branches.removeAt(index);
    _branchesAddress.removeAt(index);
    notifyListeners();
  }
  Future addActivity(context)async{

    try {
   _waitAddActivity=true;
   notifyListeners();
   _data.putIfAbsent("location", () => "");
   _data.putIfAbsent("offers", () =>  getData(offerImage));
   _data.putIfAbsent( "images", () => getData(bannerImage));
   _data.putIfAbsent("branches", () =>  getBranch());



   await   Dio().post(BASE_URL +ADD_ACTIVITY ,data:_data);
 }
 catch(e){
   print("add activity error ::$e");

 }
 finally{
   _waitAddActivity=false;
   notifyListeners();
   await Dialogs().awsomeDialog(context: context,desc: "تم اضافة نشاكط بنجاح",type:DialogType.SUCCES,title:"اضف نشاطك",onClick: Navigator.pushNamed(context, "/main"));


 }

  }
  getData(List list){
    List<Map<String,dynamic>>item=[];

    list.forEach((element)async {
      item.add({"image":await MultipartFile.fromFile(element.path, filename:element.path.split('/').last),

      });

    });
    return item;
  }
  getBranch(){
    List<Map<String,dynamic>>item=[];

    branches.forEach((element) {
      item.add({
        'latitude'      :element.latitude.toString(), // required.
        'longitude'      : element.longitude.toString(), // required.
        'location'      : "", // op.


      });

    });
    return item;
  }

}