import 'package:flutter/cupertino.dart';
import 'package:ween_arooh/network/constant.dart';
import 'package:ween_arooh/network/api.dart';
import 'package:ween_arooh/model/offersModel.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'dart:convert';
class OffersProvider extends ChangeNotifier{
  OffersModel _offersModel;
  List<Result> _offersItems;
  List<Result> _offersSearch;
  List<Result> get offersItems=>_offersItems;
  List<Result> get offersSearch=>_offersSearch;
  bool _waitOffers=false;
  bool get waitOffers=>_waitOffers;
  Future getOffers()async{
try {
  _waitOffers=true;
  notifyListeners();
  var response = await api.post(BASE_URL + GET_OFFERS, {

  });
  print(json.decode(response.body));
  print("sssssssssssss");
  _offersModel=OffersModel.fromJson(json.decode(response.body));
  _offersItems=_offersModel.result;
}
catch(e){
  print("error get offers::$e");
}
finally{
  _waitOffers=false;
  notifyListeners();

}

  }
  nameSearch(String title){
    _offersSearch=[];
    var _temp=_offersItems;
    if(title.length>0) {
      _offersSearch =
          _temp.where((element) =>
              element.titleAr.contains(title)).toList();
    }
    else{
      _offersSearch=null;
    }print(_offersSearch.length);
    print("filteeeeeeeeeeer");
    notifyListeners();
  }
  locationSearch(int id){
    _offersSearch=[];
    var _temp=_offersItems;

      _offersSearch =
          _temp.where((element) =>
              element.cityId==id).toList();

 print(_offersSearch.length);
    print("filteeeeeeeeeeer");
    notifyListeners();
  }

}