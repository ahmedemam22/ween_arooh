import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ween_arooh/network/constant.dart';
import 'package:dio/dio.dart';
import 'package:ween_arooh/model/userMarketModel.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'dart:convert';
import 'package:ween_arooh/utils/glopal_app.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/addActivityProvider.dart';

class AddOffersProvider extends ChangeNotifier{
  bool _waitAddOffer=false;
  bool get waitAddOffer=>_waitAddOffer;
  List<File>_offerImage=[];
  List<dynamic>_totalOffers=[];
  List<dynamic>_totalCoupons=[];


  List<dynamic>get offerImage=>_offerImage;
  List<dynamic>get totalOffers=>_totalOffers;
  List<dynamic>get totalCoupons=>_totalCoupons;
  List<File>_couponImage=[];
  Result _userMArketSelected;
  List<File>get copounImage=>_couponImage;
  addOffer(context)async{
    print(Provider.of<AddActivityProvider>(context,listen: false).getSelectedMarketId());

   print( getData(_totalCoupons));
    FormData formData = new FormData.fromMap({
      "coupons":await getData(_totalCoupons),
   "offers": await getData(_totalOffers),
  "oldoffers":getOffersImagesId(),
 "oldcoupons": getCopounImagesId(),
      "market_id":Provider.of<AddActivityProvider>(context,listen: false).getSelectedMarketId()
    });
    print(formData.toString());
    print('aaaaaaaaaaaaa');

  try {
    _waitAddOffer=true;
    notifyListeners();
    var response = await Dio().post(BASE_URL + ADD_OFFERS, data: formData,
        options: Options(headers:{
          HttpHeaders.authorizationHeader: 'Bearer ${GlopalApp.token}'
        } ),
      onSendProgress: (int sent, int total) {
        print('send $sent::$total');
      },);
    print(jsonDecode(response.toString()));
    Map valueMap = jsonDecode(response.toString());

    if (valueMap['code'] == 200 && valueMap['message'] == 'success') {
      print('sssssssssssssssssssssssssss');
      Provider.of<AddActivityProvider>(context,listen: true).getUserMarkets().then((value) => null);

    }
  else if(valueMap['code'] == 400 && valueMap['message'] == 'success'){
    print("errorrrrrrr");
    }

    }
  catch(e){
    print('eeeeeeeeeeeee');
    print(e.message);
    print(e.response.data);

    print('error add offers::${e}');
  }
  finally{
    _waitAddOffer=false;
notifyListeners();
Dialogs().awsomeDialog(context: context,type: DialogType.SUCCES,title: translator.translate('success'),
desc: translator.translate('succes_add_offers'));

  }

  }

  addOffers(File image){
    _totalOffers.add(image);

    notifyListeners();

  }
  addCopoun(File image){
    _totalCoupons.add(image);
    notifyListeners();
  }
  removeOffers(int index){
    _totalOffers.removeAt(index);

    notifyListeners();

  }
  removeCopoun(int index){
    _totalCoupons.removeAt(index);

    notifyListeners();
  }
 Future<List<MultipartFile>>getData(List list)async{
    List<MultipartFile>item=[];
for(int i=0;i<list.length;i++){
  if(!(list[i]is String)) {
    print('fileeeeeeeeeeeeeee');
    item.add(await MultipartFile.fromFile(list[i].path, filename: list[i].path
        .split('/')
        .last));
  }
    }
print( item.length);
print( 'lllllllllllll');
    return item;
  }

addTotalOffers(context){
    _totalOffers=[];
    final prov=Provider.of<AddActivityProvider>(context,listen: false);

    prov.userMarkets.forEach((element) {
      if(element.title==prov.selectedMarket) {
        _userMArketSelected=element;
        element.offers.forEach((e) {
          _totalOffers.add(e.path);
        });
      }});
notifyListeners();
  }
  addTotalCoupons(context){
    _totalCoupons=[];
    final prov=Provider.of<AddActivityProvider>(context,listen: false);
    prov.userMarkets.forEach((element) {
      if(element.title==prov.selectedMarket) {
        element.coupons.forEach((e) {
          _totalCoupons.add(e.path);
        });
      }});
    notifyListeners();
  }
 List<int> getOffersImagesId(){
   List<int>_ids=[];
   for(int i=0;i< _userMArketSelected.offers.length;i++) {
     for (int j = 0; j < _totalOffers.length; j++) {

         if(_userMArketSelected.offers[i] is String)
           if(_userMArketSelected.offers[i].path==_totalOffers[j]){
             _ids.add(_userMArketSelected.offers[i].id);
           }

     return _ids.toList();
  }}}
  List<int> getCopounImagesId(){
    List<int>_ids=[];
    for(int i=0;i< _userMArketSelected.coupons.length;i++) {
      for (int j = 0; j < _totalCoupons.length; j++) {
        if (_totalCoupons[j] is String) {
          if (_userMArketSelected.coupons[i].path == _totalCoupons[j]) {
            _ids.add(_userMArketSelected.coupons[i].id);
          }
        }

        print('idsssssssssssssssssssss');
        return _ids.toList();
      }
    }}}