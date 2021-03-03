import 'package:flutter/cupertino.dart';
import 'package:ween_arooh/network/api.dart';
import 'package:ween_arooh/network/constant.dart';
import 'package:ween_arooh/model/marketModel.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'dart:convert';
class MarketProvider extends ChangeNotifier{
  bool _waitMarket=false;
  bool get waitMarket=>_waitMarket;
  MarketModel _marketModel;
  List<Result>_markets;
  List<Result>_temp;
  List<Result>get markets=>_markets;

  List<Result>_marketsFilter=[];
  List<Result>get marketsFilter=>_markets;
Future getMarkets()async{
  try{
    _waitMarket=true;
    notifyListeners();
   var response=await api.post(BASE_URL+GET_MARKET, {});
   _marketModel=MarketModel.fromJson(json.decode(response.body));
   _markets=_marketModel.result;
   _temp=_markets;


  }
  catch(e){
    print("get markets error::$e");

  }
  finally{
    _waitMarket=false;
    notifyListeners();
  }


}
marketSearch(String title){
  _marketsFilter=[];
if(title.length>0) {
  _marketsFilter =
      _temp.where((element) => translator.currentLanguage == 'en' ? element
          .titleEn.contains(title) : element.titleAr.contains(title)).toList();
}
else{
  _marketsFilter=[];
}print(_marketsFilter.length);
  print("filteeeeeeeeeeer");
  notifyListeners();
}
filterByChars(){
  _temp.sort((a,b)=>a.titleEn.toLowerCase().compareTo(b.titleEn.toLowerCase()));
  _marketsFilter=_temp;
  notifyListeners();

}
  filterByLocation(){
    _temp.sort((a,b)=>double.parse(a.latitude??"0").compareTo(double.parse(b.latitude??"0")));
    _marketsFilter=_temp;
    notifyListeners();
  }
  filterByRate(){
    _temp.sort((a,b)=>(a.rate).compareTo(b.rate));
    _marketsFilter=_temp;
    notifyListeners();
  }

}