import 'package:flutter/cupertino.dart';
import 'package:ween_arooh/network/api.dart';
import 'package:ween_arooh/network/constant.dart';
import 'package:ween_arooh/model/marketModel.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
class MarketProvider extends ChangeNotifier{
  bool _waitMarket=false;
  bool _waitPagination=false;
  bool get waitMarket=>_waitMarket;
  bool get waitPagination=>_waitPagination;
  MarketModel _marketModel;
  List<Market>get mainCategoryItemsSearch=>_mainCategoryItemsSearch;
  List<Market> _mainCategoryItemsSearch=[];
  List<Market>_markets=[];
  List<Market>_temp;
  List<Market>get markets=>_markets;
  int marketIndex;
int count=1;
bool checkMarketPagination(){
  if(_markets.length==0)return true;
 else if(count<_marketModel.result.lastPage)return true;
 else return false;

}

Future getMarkets(id,[bool pagi=false])async {
  print(id);
  print(count);
  print('ccccccccc');
  if(!pagi)setCount();


   if(checkMarketPagination()){try {
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      _mainCategoryItemsSearch=[];
      print(count);
      print('cccoount');
     if(count==1) _waitMarket = true;
     else{
       _waitPagination = true;
     }
     notifyListeners();
      var response = await api.post(BASE_URL + GET_MARKET, {
        'category_id': id,
        "current_latitude":position.latitude,
        "current_longitude":position.longitude,
        "page":count
      });
      _marketModel = MarketModel.fromJson(json.decode(response.body));
      _markets .addAll( _marketModel.result.data);
      _temp = _markets;
      count++;
    }
    catch (e) {
      print("get markets error::$e");
    }
    finally {
      _waitMarket = false;
      _waitPagination = false;
      notifyListeners();

  }}
}
setCount(){
  print('seeeeeeeeeet');
  count=1;
  _markets=[];
  notifyListeners();
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
    _temp.sort((a,b)=>a.distance.compareTo(b.distance));
    _mainCategoryItemsSearch=_temp;
    notifyListeners();

  }
  filterByRate(){
    _temp.sort((a,b)=>(a.rate).compareTo(b.rate));


    _mainCategoryItemsSearch=_temp.reversed.toList();

    notifyListeners();
  }


}