import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:ween_arooh/model/NewUserMarketModel.dart';
import 'package:ween_arooh/model/citiesResponse.dart';
import 'package:ween_arooh/model/mainCategoryResponse.dart';
import 'package:ween_arooh/screens/locationView.dart';
import 'package:ween_arooh/services/provider/addActivityProvider.dart';
import 'package:ween_arooh/utils/BoxDecoration.dart';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/widgets/button_shape.dart';
import 'package:ween_arooh/utils/text_style.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/homeProvider.dart';
import 'package:ween_arooh/widgets/drawer.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:ween_arooh/utils/glopal_app.dart';
import 'package:ween_arooh/network/constant.dart';
import 'package:ween_arooh/network/api.dart';


class NewAddOffer extends StatefulWidget {


  @override
  _NewAddOfferState createState() => _NewAddOfferState();
}

class _NewAddOfferState extends State<NewAddOffer> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>(); // ADD THIS LINE

  int CategoryType=0;
  String _selection="";

  Future myFutureUserMarket;
  List<NewUserMarketModelResult> _UserMarkets = List<NewUserMarketModelResult>();

  List<File> _OfferImage;//data send
  List<File> _DiscountImage;//data send
  List<Asset> Offerimages = List<Asset>();//data pick
  List<Asset> Discountimages = List<Asset>();// data pick
  List<Asset> Offerimages = List<Asset>();//data pick
  List<Asset> Discountimages = List<Asset>();// data pick
  bool validOfferPhoto=true;
  bool validDiscountPhoto=true;
  bool validData=true;
  bool waitAddOffer=false;

  @override
  void initState() {
    myFutureUserMarket=getUserMarkets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      backgroundColor:const Color(0xffeae8e8),
      key: _scaffoldKey,
      appBar: AppBar(
        title: Center(child: Text(translator.translate('add_activity'))),
      ),
      drawer: AppDrawer(),
        body: new Container(
        child: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            Container(
              child: Column(
                  children: <Widget>[
                    choose_activity(),
                    underline(),
              ]),
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(10,10,10,0),
              margin: const EdgeInsets.fromLTRB(10,10,10,0),
            ),
            space(),
            Container(
              child: Column(
                  children: <Widget>[
                    Company_logo(),
                    underline(),
                    Main_banner(),
                    underline(),
                  ]),
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(10,10,10,0),
              margin: const EdgeInsets.fromLTRB(10,0,10,0),
            ),


            saveButton(),

          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        )
          ),
        //  margin: const EdgeInsets.all(10),

        )
    );

  }

  saveButton()
  {
    return
      Padding(
        padding:  EdgeInsets.symmetric(vertical:SizeConfig.screenWidth*s24),
        child: Container(
            width: SizeConfig.screenWidth*s175,
            height:  SizeConfig.screenWidth*s70,
            child:  Center(child:waitAddActivity?CircularProgressIndicator(): InkWell(
                onTap: ()async{
                       AddOffer();
                    },

                child: ButtonShape(translator.translate('save'),backgroundColor)))),
      );
  }

  choose_activity()
  {
    return   Row(
      children: <Widget>[
        TitleInputText(translator.translate('choose_activity'), true, validActivity),
        space(),
        DataInputType(
          Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          // margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: Style.BoxDecoration1,
          child:  FutureBuilder<List<Result>>(
              future: myFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());
                return    DropdownButton(
                  icon: Icon(
                    Icons.arrow_drop_down_circle_sharp,
                  ),
                  hint: new Text(_selection, style: TX_STYLE_black_14Point5, ),
                  underline: Container(
                    height: 0,
                  ),
                  isExpanded: true,
                  isDense: true,
                  items: _items.map((item) {
                    return new DropdownMenuItem(
                      child: new Text(item.name, style: TX_STYLE_black_14Point5),
                      value: item.name,
                    );
                  }).toList(),
                  onChanged: (newVal)async {
                    setEmptyData();
                    setInit_validation();
                    var data = _items.where((element) => element.name== newVal).first;
                    if(data != null) {
                      setState(() {
                        CategoryType = data.id;
                        _selection= data.name;
                        print(CategoryType);
                        print(_selection);
                      });

                      if(_UserMarkets!=null &&_UserMarkets.length>0)
                        {
                          SearchInmarket(CategoryType);
                        }
                      else
                        {
                          await getUserMarkets();
                          SearchInmarket(CategoryType);
                        }


                    }
                  },
                );
              }
          ),),),

          ],
    );
  }



  Company_logo()
  {
    return Row(
      children: [

        TitleInputText(translator.translate('company_logo'), true,validMainPhoto),
        space(),
        DataInputType(

              Row(
                children: [
                  InkWell(
                      onTap: (){
                        getImageFromGallery();
                      },
                      child: Image.asset("assets/images/add.png")
                  ),
                  SizedBox(width: SizeConfig.screenWidth*s20,),
                  if(imageURICompany != null)Expanded(
                    child: Container(
                      height: SizeConfig.screenWidth*s60,
                      child:  Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    child:Container(
                                    width: SizeConfig.screenWidth*s60,
                                     height: SizeConfig.screenWidth*s60,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: FileImage(imageURICompany)
                                        )
                                    )
                                    )
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    child: Icon(Icons.close,color: Colors.red,size: SizeConfig.screenWidth*s20,),
                                    onTap: (){
                                      setState(() {
                                        imageURICompany= null;
                                      });

                                    },
                                  ),
                                ),
                              ],
                            ),


                    ),
                  )

                ],

              )

            )

      ],
    );

  }

  Main_banner()
  {
    return Row(
      children: [

        TitleInputText(translator.translate('main_banner'), true, validBannerPhoto),
        space(),
        DataInputType(

            Row(
              children: [
                InkWell(
                    onTap: (){
                      pickImages();
                    },
                    child: Image.asset("assets/images/add.png")
                ),
                SizedBox(width: SizeConfig.screenWidth*s10,),
                if(images != null)Expanded(
                  child: Container(
                    height: SizeConfig.screenWidth*s60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
  itemCount:images.length,
    itemBuilder: (ctx, i) => MainCategoryShape(images[i]),
    )

                  ),
                )

              ],

            )

        )

      ],
    );

  }


  underline()
  {
    return Style.continer;
  }

  space()
  {
    return Padding(padding: const EdgeInsets.fromLTRB(0,5,0,0));

  }

  TitleInputText(String Txt,bool required , bool vaild)
  {
    return Expanded(
      flex: 1,
      child:RichText(
        text: new TextSpan(
          style:vaild? TX_STYLE_black_14Point5.copyWith(fontWeight: FontWeight.bold):TX_STYLE_black_14Point5.copyWith(fontWeight: FontWeight.bold,color: red),
          children: <TextSpan>[
            new TextSpan(text: Txt),
           if(required) new TextSpan(text: ' *', style: TX_STYLE_black_14.copyWith(color: red)),
          ],
        ),
      ),
    );
  }

  DataInputType(Widget widgetChild)
  {
    return Expanded(
      flex: 2,
      child: widgetChild
    );
  }

  MainCategoryShape(asset)
  {
    return Container(
      margin: const EdgeInsets.fromLTRB(10,0,10,0),
        child: Stack(
      children: [
      AssetThumb(
        width: 100,
      height: 100,
      asset: asset,
    ),
      Align(
        alignment: Alignment.topRight,
        child: InkWell(
          child: Icon(Icons.close,color: Colors.red,size: SizeConfig.screenWidth*s20,),
          onTap: (){
            setState(() {
              images.remove(asset);
            });

          },
        ),
      ),
      ],
    )
    );

  }

  openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }


  Future getImageFromGallery() async {

    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageURICompany = image;
      print(imageURICompany.path);
    });
  }


  Future<void> pickImages() async {
    List<Asset> resultList = List<Asset>();

    try {
      images = List<Asset>();
      resultList = await MultiImagePicker.pickImages(
        maxImages: 5,
        enableCamera: false,
        selectedAssets: images,
        materialOptions: MaterialOptions(
            actionBarTitle: "select images",
            actionBarColor: "grey",
            statusBarColor: "grey",
            selectCircleStrokeColor: "red"
        ),
      );
    } on Exception catch (e) {
      print(e);
    }
    setState(() {
      images = resultList;
    });
  }


  Future<List<Result>> getCategoryData ()async
  {
    var data = await Provider.of<HomeProvider>(context, listen: false).mainCategoryItems;
    print(data);
    print(data);
    if(data != null)
    {
      setState(() {
        _items=   data  ;
        _selection=_items[0].name;
        CategoryType= _items[0].id;
      });
      if(_UserMarkets!=null &&_UserMarkets.length>0)
      {
        SearchInmarket(CategoryType);
      }
      else
      {
        await getUserMarkets();
        SearchInmarket(CategoryType);
      }


      return data;

    }
    else
    {
      return new List< Result>();
    }

  }



  Future<List<MultipartFile>>getData(List list)async{
    List<MultipartFile>item=[];
    for(int i=0;i<list.length;i++){
      item.add(await MultipartFile.fromFile(list[i].path, filename:list[i].path.split('/').last,));

    }

    return item;
  }

  AddOffer ()async
  {
    setState(() {
      waitAddActivity=true;
      validData=true;
    });
    print('1');
    if(validation()) {
      if (images != null) {
        _bannerImage = [];
        for (Asset asset in images) {
          final filePath = await FlutterAbsolutePath.getAbsolutePath(
              asset.identifier);
          _bannerImage.add(File(filePath));
        }
      }
      print('2');
      if (imageURICompany != null) {
        _logoImage = [];
        _logoImage.add(imageURICompany);
      }


      try {
        print('4');
        print(_CityID.toString());
        print(companyName.text);
        print(brief_descriptionName.text);
        print(detailed_descriptionName.text);
        print(detailed_descriptionName.text);
        print(_CityLongitude.toString());
        print(_Cityselection);
        print(websiteName.text);
        print(emailName.text);
        print(facebookName.text);
        print(youtubeName.text);
        print(linkedinName.text);
        print(twitterName.text);
        print(twitterName.text);
        print(CategoryType.toString());
        print(GlopalApp.user.id);
        FormData formData = FormData.fromMap({
          'region_id': _CityID.toString(),
          'city_id': _CityID.toString(),
          'title_ar': companyName.text,
          'min_dec_ar': brief_descriptionName.text,
          'dec_ar': detailed_descriptionName.text,
          'latitude': _CityLatitude.toString(),
          'longitude': _CityLongitude.toString(),
          'location': _Cityselection,
          'site_link': websiteName.text,
          'email': emailName.text,
          'facebook': facebookName.text,
          'youtube': youtubeName.text,
          'twitter': twitterName.text,
          'linkedin': linkedinName.text,
          'mobile': mobileName.text,
          'category_id': CategoryType.toString(),
          'admin_id': GlopalApp.user.id,
          'banners': await getData(_bannerImage),
          'logos': await getData(_logoImage)
        });
        print('3');
        print({GlopalApp.token});
        var response = await Dio().post(BASE_URL + ADD_ACTIVITY, data: formData,
            options: Options(
                method: 'POST', responseType: ResponseType.json, headers: {
              HttpHeaders.authorizationHeader: 'Bearer ${GlopalApp.token}'
            }))
            .timeout(Duration(seconds: 2000));
        print('yeeeeeeeeeeeees');
        print(jsonDecode(response.toString()));
        Map valueMap = jsonDecode(response.toString());
        if (valueMap["code"] == 200) {


          Dialogs().awsomeDialog(context: context,
              type: DialogType.SUCCES,
              title: "اضف نشاطك",
              desc: "تم اضافة نشاطك بنجاح",
            //  onClick:   Provider.of<HomeProvider>(context,listen: false).changeIndex(1)
              );

          setEmptyData();
          setInit_validation();
        }
        else {
          await Dialogs().awsomeDialog(context: context,
            desc: "حدث خطأ",
            type: DialogType.ERROR,
            title: translator.translate('sorry'),);
        }
        setState(() {
          waitAddActivity=false;
        //  validData=true;
        });
      }
      catch (e) {
        print("add activity error ::$e");
        print("add activity error ::$e");
        await Dialogs().awsomeDialog(context: context,
          desc: "حدث خطأ ما من فضلك حاول مرة اخرى",
          type: DialogType.ERROR,
          title: translator.translate('sorry'),);
        setState(() {
          waitAddActivity = false;
        });
      }
    }
    else
      {
        await Dialogs().awsomeDialog(context: context,
          desc: "من فضلك ادخل كل البيانات الاساسية",
          type: DialogType.ERROR,
          title: "اضف نشاطك",);
        setState(() {
          waitAddActivity = false;
        });
        setState(() {
          waitAddActivity=false;
          //validData=true;
        });
      }
  }

  Future<List<NewUserMarketModelResult>> getUserMarkets()async{
    if(GlopalApp.user!=null){  try {
      var response = await api.get(BASE_URL + USER_MARKETS + '?user_id=${GlopalApp.user.id}');
      print(response);
      print('useeeeeeeeeeeeeeer');

      var data = NewUserMarketModel.fromJson(response);
      if(data.code==200)
        {
          print(data.code);
          setState(() {
            _UserMarkets=data.result;
          });
          return data.result;
        }
      else
        {
          print(data.code);
          return null;
        }


    }
    catch(e){
      print('error get user market $e');
      return null;
    }

    }
  }

  void SearchInmarket(id)
  {

        try{
          print(_UserMarkets.length);
          var data = _UserMarkets.where((element) => element.categoryId== id).first;
          if(data !=null)
            {
              setData(data);
            }
        }
        catch(e)
    {
      print('ErrorSearchInmarket');
      print(e);
    }


  }

  void setData(NewUserMarketModelResult item)
  {
    setState(() {
      companyName.text= item.title;
      _CityLongitude= item.longitude;
      _CityLatitude= item.latitude;
      LocationName.text= item.location;
      _CityID = item.cityId;
      _Cityselection=_Cityitems.where((element) => element.id==item.cityId).first.nameAr;
      mobileName.text=item.mobile;
      emailName.text=item.email;
      websiteName.text=item.siteLink;
      facebookName.text= item.facebook;
      twitterName.text =item.twitter;
      youtubeName.text =item.youtube;
      linkedinName.text =item.linkedin;
      brief_descriptionName.text=item.minDecAr;
      detailed_descriptionName.text=item.decAr;
    });
  }

  void setEmptyData()
  {
    setState(() {
      images=[];
    });
  }

  bool validation()
  {

    if(imageURICompany == null || imageURICompany.length==0)
    {
      setState(() {
        validMainPhoto=false;
        validData=false;//not valid
      });
    }
    print('validData');
    print(validData);
    return validData;

  }

  void setInit_validation()
  {

      setState(() {
        validBannerPhoto= true;
        validMainPhoto=true;
      });


  }
}

