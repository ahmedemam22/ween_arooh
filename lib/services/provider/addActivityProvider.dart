import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:ween_arooh/utils/glopal_app.dart';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/homeProvider.dart';
import 'package:ween_arooh/model/citiesResponse.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ween_arooh/network/constant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ween_arooh/model/marketModel.dart';
import 'package:ween_arooh/network/api.dart';
import 'package:ween_arooh/utils/distance.dart';
import 'package:ween_arooh/network/constant.dart';

class AddActivityProvider extends ChangeNotifier{
  List<LatLng>_branches=[];
  MarketModel _marketModel;
  List<LatLng>get branches=>_branches;
  List<String>_branchesAddress=[];
  List<String>get branchesAddress=>_branchesAddress;
  List<File>_logoImage=[];
  List<Result>_userMarkets;
  List<Result>get userMarkets=>_userMarkets;
  List<File>_bannerImage=[];
  List<File>get logoImage=>_logoImage;
  List<File>get bannerImage=>_bannerImage;
  LatLng adminLocation;
  Map<String,dynamic> _oldMarket;
  Map<String,dynamic> get oldMArket=>_oldMarket;

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
   _data.putIfAbsent("category_id", () =>Provider.of<HomeProvider>(context,listen: false).getCategoryId(category));
   _data.putIfAbsent( "images", () => getData(bannerImage));
   _data.putIfAbsent("branches", () =>  getBranch());
   _data.putIfAbsent("admin_id", () =>  GlopalApp.user.id);
   _data.putIfAbsent("latitude", () =>  adminLocation.latitude);
   _data.putIfAbsent("longitude", () => adminLocation.longitude);
   print(setCityId(context, adminLocation.latitude, adminLocation.longitude));
   print('idddddddddddddddddd');
   _data.putIfAbsent("city_id", () => setCityId(context, adminLocation.latitude, adminLocation.longitude));

/*{
     "title_ar":"asd",
     "title_en":"asd",
     "min_dec_ar":"asd",
     "min_dec_en":"asd",
     "dec_ar":"asd",
     "dec_en":"asd",
     "latitude":"30.000",
     "longitude":"30.000",
     "site_link":"asd",
     "email":"asd",
     "facebook":"asd",
     "youtube":"asd",
     "twitter":"asd",
     "linkedin":"asd",
     "is_management":"asd",
     "parent_id":1,
     "category_id":Provider.of<HomeProvider>(context,listen: false).getCategoryId(category),
     "admin_id":1
   },*/
print(_data);
print('daaaaaaataaa');

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
   }
   else if(valueMap['code'] == 400 && valueMap['message'] == 'success'){
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
  addSocialMedia(String value,context){
    social=value;
    notifyListeners();

  }
  setCategory(value,context){
    category=value;
    getMarketId(value,context);
   notifyListeners();

  }
  setAdminLoication(LatLng latng){
    adminLocation=latng;
    notifyListeners();

  }
  Future getUserMarkets()async{
    try {
      var response = await api.get(BASE_URL + USER_MARKETS + '?user_id=1');

      _marketModel = MarketModel.fromJson(response);
      _userMarkets = _marketModel.result;

    }
    catch(e){
      print('error get user market $e');
    }
    finally{

    }

  }
  getMarketId(value,context){
    _oldMarket=null;
    for(int i=0;i<_userMarkets.length;i++) {
      print(Provider.of<HomeProvider>(context,listen: false).getCategoryId(category));
      print(_userMarkets[i].category_id);
      if( _userMarkets[i].category_id==Provider.of<HomeProvider>(context,listen: false).getCategoryId(category)) {
        print('7ssssssssl');
        _oldMarket = _userMarkets[i].toJson();
      }
      if(_oldMarket!=null)  print(_oldMarket.length);
    }


    notifyListeners();
  }
  defaultImagesOldMarket(bool logo){
   if(logo) _oldMarket['logo']=null;
    else _oldMarket['panner']=null;
  }
  int setCityId(context,lat,long){
    int city_id=1;
    int maxDistance=1000000000000000000;
    int distance;
    List<City>item= Provider.of<HomeProvider>(context,listen: false).citiesList;
    item.forEach((element) {
      distance=Distanc(context).calculateDistance(double.parse(element.latitude), double.parse(element.longitude), adminLocation.latitude, adminLocation.longitude);
      if(distance<maxDistance){
        maxDistance=distance;
        city_id=element.id;

      }
    });
return city_id;

  }
}