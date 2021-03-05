import 'package:flutter/cupertino.dart';
import 'package:ween_arooh/network/constant.dart';
import 'package:ween_arooh/network/api.dart';
import 'package:ween_arooh/model/offersModel.dart';
import 'dart:convert';
class OffersProvider extends ChangeNotifier{
  OffersModel _offersModel;
  List<Result> _offersItems;
  List<Result> get offersItems=>_offersItems;
  bool _waitOffers=false;
  bool get waitOffers=>_waitOffers;
  Future getOffers()async{
try {
  _waitOffers=true;
  notifyListeners();
  var response = await api.post(BASE_URL + GET_OFFERS, {
    "category_id": "1", // op.
    "market_id": "1", // op.
  });
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

}