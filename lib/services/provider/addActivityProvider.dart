import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:ween_arooh/utils/glopal_app.dart';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/homeProvider.dart';
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

  Map<String,dynamic>_data={};
  Map<String,dynamic>get data=>_data;
  bool _waitAddActivity=false;
  bool get waitAddActivity=>_waitAddActivity;
  String social='facebook';
  String category;
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

  addLogo(File image){
  if(_logoImage.length==0)  _logoImage.add(image);
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
  removeImageBanner(int index){
    _bannerImage.removeAt(index);
    ;
    notifyListeners();

  }

  removeLogo(int index){
    _logoImage.removeAt(index);
    notifyListeners();
  }
  Future addActivity(context)async{

    try {
   _waitAddActivity=true;
   notifyListeners();
   print(Provider.of<HomeProvider>(context,listen: false).getCategoryId(category));
   _data.putIfAbsent("category_id", () =>Provider.of<HomeProvider>(context,listen: false).getCategoryId(category));
   _data.putIfAbsent("location", () => "");
   _data.putIfAbsent( "images", () => getData(bannerImage));
   _data.putIfAbsent("branches", () =>  getBranch());



   var response=await   Dio().post(BASE_URL +ADD_ACTIVITY ,data:_data,
     options: Options(headers:{
       HttpHeaders.authorizationHeader: 'Bearer ${GlopalApp.token}'
     } ),
     onSendProgress: (int sent, int total) {
       print('send $sent::$total');
     },);
   _waitAddActivity=false;
   notifyListeners();
   await Dialogs().awsomeDialog(context: context,desc: "تم اضافة نشاطك بنجاح",type:DialogType.SUCCES,title:"اضف نشاطك",);
   print(jsonDecode(response.toString()));
   Map valueMap = jsonDecode(response.toString());

   if (valueMap['code'] == 200 && valueMap['message'] == 'success') {
     print('sssssssssssssssssssssssssss');
   }
   else if(valueMap['code'] == 400 && valueMap['message'] == 'success'){
     print("errorrrrrrr");
   }
    }
 catch(e){
   print("add activity error ::$e");

 }
 finally{
   _waitAddActivity=false;
   notifyListeners();


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
  addSocialMedia(String value){
    social=value;
    notifyListeners();

  }
  setCategory(value){
    category=value;
   notifyListeners();

  }

}