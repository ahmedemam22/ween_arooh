import 'package:flutter/cupertino.dart';
import 'package:ween_arooh/network/constant.dart';
import 'package:ween_arooh/network/api.dart';
import 'package:ween_arooh/model/rateModel.dart';
import 'package:ween_arooh/model/marketDetailsResponse.dart';
import 'package:ween_arooh/utils/glopal_app.dart';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
class MarketDetailsProvider extends ChangeNotifier{
  RateModel _rateModel;
  RateModel get rateModel=>_rateModel;
  List<Recomendations>_rates;
  List<Recomendations>get rates=>_rates;
  bool _waitMakeRate=false;
  bool get waitMakeRate=>_waitMakeRate;
  bool _waitRate=false;
  bool get waitRate=>_waitRate;
  int _selectId;
  int get getId=>_selectId;
  String markeTitle;
  double rate=3.0;
  bool _waitMarketDetails=false;
  bool get waitMarketDetails=>_waitMarketDetails;
  MarketDetailsResponse _marketDetails;
  MarketDetailsResponse get marketDetails=>_marketDetails;
  Future addRate(comment)async{

    try{
      _waitMakeRate=true;
      notifyListeners();
    await api.post(BASE_URL+RATE, {
    "market_id" : _marketDetails.id,
    "user_id" : GlopalApp.user.id,
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
     var response=await api.get(BASE_URL+SHOW_RATE+_marketDetails.id.toString());
   _rateModel=RateModel.fromJson(response);
   _rates=_rateModel.result.market[0].recomendations;
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
  Future getMarketDetails(marketID)async{
  try{
    markeTitle='';
    _waitMarketDetails=true;
    notifyListeners();
    var response= await api.get(BASE_URL+MARKET_DETAILS+marketID.toString());
  _marketDetails=MarketDetailsResponse.fromJson(response);
  markeTitle=_marketDetails.title;

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
   if(_marketDetails!=null) _marketDetails.images.forEach((element) {_images.add(element.path);});
    return _images;
  }

}