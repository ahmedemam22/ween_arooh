import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ween_arooh/network/constant.dart';
import 'package:dio/dio.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'dart:convert';
import 'package:ween_arooh/utils/glopal_app.dart';

class AddOffersProvider extends ChangeNotifier{
  bool _waitAddOffer=false;
  bool get waitAddOffer=>_waitAddOffer;
  List<File>_offerImage=[];
  List<File>get offerImage=>_offerImage;
  List<File>_couponImage=[];
  List<File>get copounImage=>_couponImage;
  addOffer(context)async{
    FormData formData = new FormData.fromMap({
      "coupons":await getData(_couponImage),
   "offers": await getData(_offerImage),
      "market_id":1
    });

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
  }
  else if(valueMap['code'] == 400 && valueMap['message'] == 'success'){
    print("errorrrrrrr");
    }

    }
  catch(e){
    print(e.message);

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
    _offerImage.add(image);
    notifyListeners();

  }
  addCopoun(File image){
    _couponImage.add(image);
    notifyListeners();
  }
  removeOffers(int index){
    _offerImage.removeAt(index);

    notifyListeners();

  }
  removeCopoun(int index){
    _couponImage.removeAt(index);

    notifyListeners();
  }
 Future<List<MultipartFile>>getData(List list)async{
    List<MultipartFile>item=[];
for(int i=0;i<list.length;i++){
  item.add(await MultipartFile.fromFile(list[i].path, filename:list[i].path.split('/').last));

    }

    return item;
  }

}