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
  List<Result>_markets=[];

  List<Result>_temp;
  List<Result>get markets=>_markets;
  int marketIndex;
int count=0;

Future getMarkets(id)async {
  if (count == 0) {
    try {
      _mainCategoryItemsSearch=[];
      _waitMarket = true;
      var response = await api.post(BASE_URL + GET_MARKET, {
        'category_id': id
      });
      _marketModel = MarketModel.fromJson(json.decode(response.body));
      _markets = _marketModel.result;
      _temp = _markets;
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
setCount(){
  count=0;
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
  _temp.sort((a,b)=>translator.currentLanguage=='en'?a.titleEn.toLowerCase().compareTo(b.titleEn.toLowerCase()):a.titleAr.toLowerCase().compareTo(b.titleAr.toLowerCase()));
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


    _mainCategoryItemsSearch=_temp.reversed.toList();

    notifyListeners();
  }
  List<String> userMarketsList(){
  return['test MA 4-3','mmmmmmmmmmm','mmmmmmmmmmm'];
   /* List<String>_categoryNames=[];
    _userMarkets.forEach((element) {
      _categoryNames.add(element.title.substring(0,2));});
    return _categoryNames;*/

  }


}