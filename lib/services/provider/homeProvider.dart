import 'package:flutter/cupertino.dart';
import 'package:ween_arooh/network/api.dart';
import 'package:ween_arooh/network/constant.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/model/mainCategoryResponse.dart';
class HomeProvider extends ChangeNotifier{
  MainCategoryResponse _mainCategoryResponse;
  List<Result> _mainCategoryItems=[];
  List<Result> _mainCategoryItemsSearch=[];
  List<Result> get mainCategoryItems=>_mainCategoryItems;
  List<Result> get mainCategoryItemsSearch=>_mainCategoryItemsSearch;
  bool _waitMainCategory=false;
  bool get waitMainCategory=>_waitMainCategory;
  Future getMainCategories()async{
 try{
   _waitMainCategory=true;
   notifyListeners();
   var  response=await api.get(BASE_URL+MAIN_CATEGORY,true);
 _mainCategoryResponse=MainCategoryResponse.fromJson(response);
 _mainCategoryItems=_mainCategoryResponse.result;

 }
 catch(e){
   print("error main category ::$e");
 }
 finally{
   _waitMainCategory=false;
   notifyListeners();
 }
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
    _mainCategoryItems.forEach((element) {
      if(element.nameAr==title){
        return element.id;
      }
    });

  }
}