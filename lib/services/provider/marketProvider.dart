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
  List<Result>get mainCategoryItemsSearch=>_mainCategoryItemsSearch;
  List<Result> _mainCategoryItemsSearch=[];
  List<Result>_markets;
  List<Result>_temp;
  List<Result>get markets=>_markets;

  int count=0;
Future getMarkets()async{
  if(count==0) {
    try {
      count++;

      _waitMarket = true;
      notifyListeners();
      var response = await api.post(BASE_URL + GET_MARKET, {
      });
      _marketModel = MarketModel.fromJson(json.decode(response.body));
      _markets = _marketModel.result;
      _temp=_markets;
      print(_markets[0].title);
      print(_markets[1].title);
      print(_markets[2].title);
      print('loooooooooooooooooc');
    }
    catch (e) {
      print("get markets error::$e");
    }
    finally {
      _waitMarket = false;
      notifyListeners();
    }
  }

}
marketSearch(String title){
  var temp=markets;
  _mainCategoryItemsSearch=temp.where((element) => translator.currentLanguage=='en'?element.titleEn.contains(title):element.titleAr.contains(title)).toList();
  notifyListeners();
  /*_marketsFilter=[];
if(title.length>0) {
  _marketsFilter =
      _temp.where((element) => translator.currentLanguage == 'en' ? element
          .titleEn.contains(title) : element.titleAr.contains(title)).toList();
}
else{
  _marketsFilter=[];
}print(_marketsFilter.length);
  print("filteeeeeeeeeeer");
  notifyListeners();*/
}
filterByChars(){
  _temp.sort((a,b)=>a.titleEn.toLowerCase().compareTo(b.titleEn.toLowerCase()));
  _mainCategoryItemsSearch=_temp;
  notifyListeners();

}
  filterByLocation(){
    _temp.sort((a,b)=>a.latitude.compareTo(b.latitude));
    _mainCategoryItemsSearch=_temp;
    notifyListeners();

  }
  filterByRate(){
    _temp.sort((a,b)=>(a.rate).compareTo(b.rate));

    _mainCategoryItemsSearch=_temp;

    notifyListeners();
  }

}