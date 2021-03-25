import 'package:flutter/cupertino.dart';
import 'package:ween_arooh/network/api.dart';
import 'package:ween_arooh/network/constant.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/model/mainCategoryResponse.dart';
import 'package:ween_arooh/model/citiesResponse.dart';
import 'package:ween_arooh/utils/glopal_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/userProvider.dart';
class HomeProvider extends ChangeNotifier{
  List<City>_citiesList;
  List<City>get citiesList=>_citiesList;
  MainCategoryResponse _mainCategoryResponse;
  List<Result> _mainCategoryItems=[];
  List<Result> _mainCategoryItemsSearch=[];
  List<Result> get mainCategoryItems=>_mainCategoryItems;
  List<Result> get mainCategoryItemsSearch=>_mainCategoryItemsSearch;
  bool _waitMainCategory=false;
  bool get waitMainCategory=>_waitMainCategory;
  int count=0;
  Future getMainCategories([token])async{
    if(count==0){
 try{
   print(++count);
   _mainCategoryItems=[];
   _waitMainCategory=true;

   var  response=await api.get(BASE_URL+MAIN_CATEGORY,token);

 _mainCategoryResponse=MainCategoryResponse.fromJson(response);
 _mainCategoryItems=_mainCategoryResponse.result;

 }
 catch(e){
   print("error main category ::$e");
 }
 finally{
   _waitMainCategory=false;
   notifyListeners();
 }}
  }
makeSearch(String title){
    var temp=_mainCategoryItems;
    _mainCategoryItemsSearch=temp.where((element) => translator.currentLanguage=='en'?element.nameEn.contains(title):element.nameAr.contains(title)).toList();
notifyListeners();
  }
  List<String> categoriesList(){
    List<String>_categoryNames=[];
    _mainCategoryItems.forEach((element) {_categoryNames.add(element.name);});
    return _categoryNames;

  }
  int getCategoryId(String title){
    print(title);
    print("vvvvvvvvvvv");
    _mainCategoryItems.forEach((element) {
      if(element.nameAr==title){
        return element.id;
      }
    });

  }
  Future getCities()async{
    try {
     var response= await api.get(BASE_URL + CITIES);
     CitiesResponse _city=CitiesResponse.fromJson(response);
     _citiesList=_city.result;
     print(_citiesList[0].nameAr);
     print('nnnnnnnnnnnnm');
    }
    catch(e){
      print('error get cities$e');
    }
    finally{
notifyListeners();
    }
  }
}