import 'package:flutter/cupertino.dart';
import 'package:ween_arooh/network/constant.dart';
import 'package:ween_arooh/network/api.dart';
import 'package:ween_arooh/model/rateModel.dart';
import 'package:ween_arooh/model/marketDetailsResponse.dart';
class MarketDetailsProvider extends ChangeNotifier{

  RateModel _rateModel;
  RateModel get rateModel=>_rateModel;
  List<ResultElement>_rates;
  List<ResultElement>get rates=>_rates;
  bool _waitMakeRate=false;
  bool get waitMakeRate=>_waitMakeRate;
  bool _waitRate=false;
  bool get waitRate=>_waitRate;
  int _selectId;
  double rate;
  bool _waitMarketDetails=false;
  bool get waitMarketDetails=>_waitMarketDetails;
  MarketDetailsResponse _marketDetails;
  MarketDetailsResponse get marketDetails=>_marketDetails;
  Future addRate(comment)async{
    _waitMakeRate=true;
    notifyListeners();
    try{
    await api.post(BASE_URL+RATE, {
    "market_id" : "1",
    "user_id" : "2",
    "rate" : rate.toString(),
    "comment" : comment,
    "visits_count" : "0"
    });}
    catch(e){
      print("error add rate ::$e");
    }
    finally{
      _waitMakeRate=false;
      notifyListeners();
    }

  }
  saveRate(double value){
    rate=value;
    notifyListeners();
  }
  Future getRates()async{
   try{
     _waitRate=true;
     notifyListeners();
     var response=await api.get(BASE_URL+SHOW_RATE+"1");
   _rateModel=RateModel.fromJson(response);
   _rates=_rateModel.result.result;
   }
   catch(e){
     print("get rates error ::$e");
   }
   finally{
     _waitRate=false;
     notifyListeners();

   }
  }
  selectId(id){
    _selectId=id;
    notifyListeners();
  }
  Future getMarketDetails()async{
  try{
    _waitMarketDetails=true;
    notifyListeners();
    var response= await api.get(BASE_URL+MARKET_DETAILS+"1");
  _marketDetails=MarketDetailsResponse.fromJson(response);
  }
  catch(e){
    print("error get market details ::$e");
  }
  finally{
    _waitMarketDetails=false;
    notifyListeners();

  }
  }
  List<String> getImages(){
    List<String>_images=[];
    _marketDetails.images.forEach((element) {_images.add(element.path);});
    return _images;
  }

}