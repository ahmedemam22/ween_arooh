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
import 'package:ween_arooh/model/userMarketModel.dart';
import 'package:ween_arooh/network/api.dart';
import 'package:ween_arooh/utils/distance.dart';
import 'package:ween_arooh/network/constant.dart';

class AddActivityProvider extends ChangeNotifier{
  List<LatLng>_branches=[];
  UserMarketModel _marketModel;
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
  String location;
  Map<String,dynamic> _oldMarket;
  Map<String,dynamic> get oldMArket=>_oldMarket;
  bool _checkOldMArket=false;
  bool get checkOldMArket=>_checkOldMArket;
  City _selectedCity;
  City get selectedCity=>_selectedCity;
  String _selectedMarket;
  String get selectedMarket=>_selectedMarket;

  Map<String,dynamic>_data={};
  Map<String,dynamic>get data=>_data;
  bool _waitAddActivity=false;

  bool get waitAddActivity=>_waitAddActivity;
  String social='facebook';
  String category;

  setData(String key,value){
    if(_data.containsKey(key)){
print('aywaaaaaaaa');
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
  else{
    _logoImage[0]=image;
  }
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
    Response  response;
    try {
      Map<String,dynamic> _items={
        'banners':await getData(_bannerImage),
        'logos':await getData(_logoImage),
        'region_id':1,
      };
      _data.addAll(_items);
      print(location);
   _waitAddActivity=true;
   notifyListeners();
   var logo= await getData(logoImage);
   var banner= await getData(bannerImage);
   _data.putIfAbsent("category_id", () =>Provider.of<HomeProvider>(context,listen: false).getCategoryId(category));
   //_data.putIfAbsent( "logos", () =>logo );
   //_data.putIfAbsent( "banners", () => banner);
  // _data.putIfAbsent("branches", () =>  branches.length>0?getBranch():null);
   _data.putIfAbsent("admin_id", () =>  GlopalApp.user.id);
   _data.putIfAbsent("location", () =>  location);
   _data.putIfAbsent("latitude", () =>  adminLocation.latitude);
   _data.putIfAbsent("longitude", () => adminLocation.longitude);
   _data.putIfAbsent("city_id", () =>selectedCity==null?1:selectedCity.id);

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

      FormData formData = new FormData.fromMap(_data);


    response=await   Dio().post(BASE_URL +ADD_ACTIVITY ,data:formData,
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
     _data={};
     _logoImage=[];
     _bannerImage=[];
     category='';
     getUserMarkets();
   }
   else if(valueMap['code'] == 400 && valueMap['message'] == 'success'){
     print(valueMap['result']);
     print('rssssssssssssssss');
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
  Future<List<MultipartFile>>getData(List list)async{
    List<MultipartFile>item=[];
    for(int i=0;i<list.length;i++){
      item.add(await MultipartFile.fromFile(list[i].path, filename:list[i].path.split('/').last));

    }

    return item;
  }
  List<Map<String,dynamic>> getBranch(){
    List<Map<String,dynamic>>item=[];
for(int i=0;i<branches.length;i++){
  item.add({
    'latitude'      :branches[i].latitude.toString(), // required.
    'longitude'      : branches[i].longitude.toString(), // required.
    'location'      : branchesAddress ??'', // op.


  });
}


   // print(item[0]['latitude']);
print(branches.length);
    print('laaaaaaaaaat');
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
  setSelectedMarket(value,context){
    _selectedMarket=value;
    notifyListeners();


 //  return getSelectedMarketId();

  }
 int getSelectedMarketId(){
    int id;
    _userMarkets.forEach((element) {
      if(element.title==_selectedMarket){
        id=element.id;

      }
    });
    return id;

  }
  setCity([value,context]){
    if(value==null)_selectedCity=Provider.of<HomeProvider>(context,listen: false).citiesList[0];
   else{ List<City>_city=Provider.of<HomeProvider>(context,listen: false).citiesList;
    _city.forEach((element) {
      if(element.nameAr==value){
        _selectedCity=element;
      }
    });}

    notifyListeners();

  }
  setAdminLoication(LatLng latng,String location){
    adminLocation=latng;
    location=location;
    notifyListeners();

  }
  Future getUserMarkets()async{
  if(GlopalApp.user!=null){  try {
      var response = await api.get(BASE_URL + USER_MARKETS + '?user_id=${GlopalApp.user.id}');
      print(response);
      print('useeeeeeeeeeeeeeer');

      _marketModel = UserMarketModel.fromJson(response);
      _userMarkets = _marketModel.result;

    }
    catch(e){
      print('error get user market $e');
    }
    finally{

    }

  }}
  getMarketId(value,context){
    _oldMarket=null;
    _checkOldMArket=false;
    for(int i=0;i<_userMarkets.length;i++) {
      print(Provider.of<HomeProvider>(context,listen: false).getCategoryId(category));
      if( _userMarkets[i].categoryId==Provider.of<HomeProvider>(context,listen: false).getCategoryId(category)) {
        print('7ssssssssl');
        _oldMarket = _userMarkets[i].toJson();
        adminLocation=LatLng(_oldMarket['latitude'],_oldMarket['longitude']);
        _checkOldMArket=true;

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
  List<String> getUserMArketItems(){
    Set<String>_items={};
    _userMarkets.forEach((element) {
      _items.add(element.title);
    });
    return _items.toList();
  }

}