import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'package:ween_arooh/model/NewUserMarketModel.dart';
import 'package:ween_arooh/model/citiesResponse.dart';
import 'package:ween_arooh/model/mainCategoryResponse.dart';
import 'package:ween_arooh/model/offersModel.dart';
import 'package:ween_arooh/screens/locationView.dart';
import 'package:ween_arooh/services/provider/addActivityProvider.dart';
import 'package:ween_arooh/utils/BoxDecoration.dart';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/widgets/bottomNavigationBar.dart';
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
  List<File> _VideoFileList=[];
  List<Offers> _old_VideoFile=[];
  List<int> _old_VideoFileId=[];
  bool waitAddActivity=false;
  List<Offers> _oldoffersImage=[];
  List<int> _oldoffersImageId=[];
  List<Coupons> _oldcouponsImage=[];
  List<int> _oldcouponsImageId=[];
  List<Asset> _newofferimages = List<Asset>();
  List<Asset> _newcouponsimages = List<Asset>();
  List<File> _OffersImage=[];
  List<File> _CouponsImage=[];
  bool validData=true;

  @override
  void initState() {
    myFutureUserMarket=getUserMarkets();

    // Use the controller to loop the video.
   // _controller.setLooping(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(

            backgroundColor:const Color(0xffeae8e8),
            bottomNavigationBar:  BottomnavigationBar(main_Screen: false),
            appBar: AppBar(
              backgroundColor: backgroundColor,

              title: Center(child: Text(translator.translate('add_offers'))),
            ),
            key: _scaffoldKey,
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
                          Text(translator.translate('offers'),style: TX_STYLE_black_14Point5.copyWith(fontWeight: FontWeight.bold),),
                          space(),
                          space(),
                          space(),
                          add_offers(),
                          underline(),
                          OfferVideo_picker(),
                          underline(),
                        ]),
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(10,10,10,0),
                    margin: const EdgeInsets.fromLTRB(10,0,10,0),
                  ),
                  space(),
                  Container(
                    child: Column(
                        children: <Widget>[
                          Text(translator.translate('discount'),style: TX_STYLE_black_14Point5.copyWith(fontWeight: FontWeight.bold),),
                          space(),
                          space(),
                          space(),
                          add_coupons(),
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

        ),
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
        TitleInputText(translator.translate('choose_market'), true, true),
        space(),
        DataInputType(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            // margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: Style.BoxDecoration1,
            child:  FutureBuilder<List<NewUserMarketModelResult>>(
                future: myFutureUserMarket,
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
                    items: _UserMarkets.map((item) {
                      return new DropdownMenuItem(
                        child: new Text(item.titleAr, style: TX_STYLE_black_14Point5),
                        value: item.id,
                      );
                    }).toList(),
                    onChanged: (newVal)async {
                      print('newVal');
                      print(newVal);
                      setEmptyData();
                      setInit_validation();
                      var data = _UserMarkets.where((element) => element.id== newVal).first;
                      if(data != null) {
                        setState(() {
                          CategoryType = data.id;
                          _selection= data.titleAr;
                          print(CategoryType);
                          print(_selection);
                        });

                          SearchInmarket(CategoryType);


                      }
                    },
                  );
                }
            ),),),

      ],
    );
  }

  OfferVideo_picker()
  {
    return Row(
      children: [

        TitleInputText(translator.translate('add_video'),false,true),
        space(),
        DataInputType(

            Row(
              children: [
                InkWell(
                    onTap: (){
                      getVideoFromGallery();
                    },
                    child: Image.asset("assets/images/add.png")
                ),
                SizedBox(width: SizeConfig.screenWidth*s10,),
                Expanded(
                    child:Container(
                        height: (_VideoFileList != null && _VideoFileList.length>0 && _old_VideoFileId != null && _old_VideoFileId.length>0)? SizeConfig.screenWidth*s120:SizeConfig.screenWidth*s60,
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if(_old_VideoFileId != null&& _old_VideoFileId.length>0)Expanded(
                                child: Container(
                                    height: SizeConfig.screenWidth*s60,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:_old_VideoFileId.length,
                                      itemBuilder: (ctx, i) => VideoShape2(_old_VideoFile,_old_VideoFileId,_old_VideoFile[i], true, null ,null),
                                    )

                                ),
                              ),
                              if(_VideoFileList != null && _VideoFileList.length>0)Expanded(
                                child: Container(
                                    height: SizeConfig.screenWidth*s60,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:_VideoFileList.length,
                                      itemBuilder: (ctx, i) => VideoShape2(null,null,null, false, _VideoFileList,_VideoFileList[i]),
                                    )

                                ),
                              ),
                            ])))
              ],

            )

        )

      ],
    );

  }

  add_offers()
  {
    return Row(
      children: [

       // TitleInputText(translator.translate('add_copoun'), true, validBannerPhoto),
        TitleInputText(translator.translate('add_photo'), false, true),
        space(),
        DataInputType(

            Row(
              children: [
                InkWell(
                    onTap: (){
                      pickOfferImages();
                    },
                    child: Image.asset("assets/images/add.png")
                ),
                SizedBox(width: SizeConfig.screenWidth*s10,),
                Expanded(
                    child:Container(
                        height: (_newofferimages != null && _newofferimages.length>0 && _oldoffersImageId != null && _oldoffersImageId.length>0)? SizeConfig.screenWidth*s120:SizeConfig.screenWidth*s60,
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if(_oldoffersImageId != null&& _oldoffersImageId.length>0)Expanded(
                                child: Container(
                                    height: SizeConfig.screenWidth*s60,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:_oldoffersImage.length,
                                      itemBuilder: (ctx, i) => MainCategoryShape2(_oldoffersImage,_oldoffersImageId,_oldoffersImage[i]),
                                    )

                                ),
                              ),
                              if(_newofferimages != null && _newofferimages.length>0)Expanded(
                                child: Container(
                                    height: SizeConfig.screenWidth*s60,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:_newofferimages.length,
                                      itemBuilder: (ctx, i) => MainCategoryShape(_newofferimages,_newofferimages[i]),
                                    )

                                ),
                              ),
                            ])))
              ],

            )

        )

      ],
    );

  }

  add_coupons()
  {
    return Row(
      children: [

         TitleInputText(translator.translate( 'add_photo'),false, true),
        space(),
        DataInputType(

            Row(
              children: [
                InkWell(
                    onTap: (){
                      pickCouponsImages();
                    },
                    child: Image.asset("assets/images/add.png")
                ),
                SizedBox(width: SizeConfig.screenWidth*s10,),
                Expanded(
                    child:Container(
                        height: (_newcouponsimages != null && _newcouponsimages.length>0 && _oldcouponsImageId != null && _oldcouponsImageId.length>0)? SizeConfig.screenWidth*s120:SizeConfig.screenWidth*s60,
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if(_oldcouponsImageId != null&& _oldcouponsImageId.length>0)Expanded(
                                child: Container(
                                    height: SizeConfig.screenWidth*s60,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:_oldcouponsImage.length,
                                      itemBuilder: (ctx, i) => MainCategoryShape2(_oldcouponsImage,_oldcouponsImageId,_oldcouponsImage[i]),
                                    )

                                ),
                              ),
                              if(_newcouponsimages != null && _newcouponsimages.length>0)Expanded(
                                child: Container(
                                    height: SizeConfig.screenWidth*s60,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:_newcouponsimages.length,
                                      itemBuilder: (ctx, i) => MainCategoryShape(_newcouponsimages,_newcouponsimages[i]),
                                    )

                                ),
                              ),
                            ])))
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

// new banner _newofferimages
  MainCategoryShape(_list,asset)
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
                    _list.remove(asset);
                  });

                },
              ),
            ),
          ],
        )
    );

  }
//old banner _newofferimages
  MainCategoryShape2(list,intlist,data)
  {
    return Container(
      margin: const EdgeInsets.fromLTRB(10,0,10,0),
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
                    image:    DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(data.path)),
                  )
              )
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              child: Icon(Icons.close,color: Colors.red,size: SizeConfig.screenWidth*s20,),
              onTap: (){
                setState(() {
                  list.remove(data);
                  intlist.remove(data.id);
                });

              },
            ),
          ),
        ],
      ),


    );

  }



  VideoShape2(List<Offers> oldoffer,List<int> oldofferid,Offers oldofferItem, bool newtork, List<File> newoffer, File newofferItem )
  {
    print('helooooo');
    return Container(
      margin: const EdgeInsets.fromLTRB(10,0,10,0),
     child:   Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child:Container(
                  width: SizeConfig.screenWidth*s40,
                  height: SizeConfig.screenWidth*s60,
                  child: InkWell (child: Image.asset("assets/images/play_button.png"),
                  onTap: (){
                    Navigator.pushNamed(
                      context, '/display_video',
                      arguments:VideoArguments(newofferItem, newtork,oldofferItem),);
                  },)
              )
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              child: Icon(Icons.close,color: Colors.red,size: SizeConfig.screenWidth*s20,),
              onTap: (){
                if(newtork)
                  {
                  //  List<Offers> oldoffer,List<int> oldofferid,Offers oldofferItem, bool newtork, List<File> newoffer, File newofferItem
                 setState(() {
                   oldoffer.remove(oldofferItem);
                   oldofferid.remove(oldofferItem.id);
                 });
                  }
                else
                  {
                    setState(() {
                      newoffer.remove(newofferItem);
                    });

                  }

              },
            ),
          ),
        ],
      ),


    );

  }

  openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  Future getVideoFromGallery() async {
    //  var image = await ImagePicker.pickVideo(source: ImageSource.gallery);
    final _picker = ImagePicker();
    File video = await ImagePicker.pickVideo(source:ImageSource.gallery);

    print('video');
    print(  video.path);
    setState(() {
      _VideoFileList.add(video);

    });
    print('video');
    print(  video.path);
    print(  _VideoFileList.length);
  }

  Future<void> pickOfferImages() async {
    List<Asset> resultList = List<Asset>();

    try {
      _newofferimages = List<Asset>();
      resultList = await MultiImagePicker.pickImages(
        maxImages: 5,
        enableCamera: false,
        selectedAssets: _newofferimages,
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
      _newofferimages = resultList;
    });
  }

  Future<void> pickCouponsImages() async {
    List<Asset> resultList = List<Asset>();

    try {
      _newcouponsimages = List<Asset>();
      resultList = await MultiImagePicker.pickImages(
        maxImages: 5,
        enableCamera: false,
        selectedAssets: _newcouponsimages,
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
      _newcouponsimages = resultList;
    });
  }



  Future<List<MultipartFile>>getData(List list)async{

    List<MultipartFile>item=[];
    if(list != null ) {
      for (int i = 0; i < list.length; i++) {
        item.add(
            await MultipartFile.fromFile(list[i].path, filename: list[i].path
                .split('/')
                .last,));
        print(item[i]);
      }
    }
    return item;
  }

  AddOffer()async
  {
    setState(() {
      waitAddActivity=true;
      validData=true;
      _OffersImage=[];
      _CouponsImage=[];
    });

    print('1');
    if(validation()) {
      if (_newofferimages != null ) {
        try {
          if (_newofferimages.length != 0 ) {
            for (Asset asset in _newofferimages) {
              final filePath = await FlutterAbsolutePath.getAbsolutePath(
                  asset.identifier);
              _OffersImage.add(File(filePath));
            }
          }
        }
        catch(e){}
      }
      print('2');
      if (_newcouponsimages != null ) {
        try {
          if (_newcouponsimages.length != 0 ) {
            for (Asset asset in _newcouponsimages) {
              final filePath = await FlutterAbsolutePath.getAbsolutePath(
                  asset.identifier);
              _CouponsImage.add(File(filePath));
            }
          }
        }
        catch(e){}
      }
      print('3');
      if (_VideoFileList != null ) {
        try {
          if (_VideoFileList.length != 0 ) {
            for (var file in _VideoFileList) {
              _OffersImage.add(file);
            }
          }
        }
        catch(e){}
      }
      print('4');
      if(_old_VideoFileId != null)
        {
        try {
          if (_old_VideoFileId.length != 0 ) {
            for (var id in _old_VideoFileId) {
              _oldoffersImageId.add(id);
            }
          }
        }
        catch(e){}
        }

      /*
      for (var file in _OffersImage) {
        print('_OffersImage');
        print(file.path);
      }
      for (var file in _CouponsImage) {
        print('_CouponsImage');
        print(file.path);
      }
      for (var id in _oldoffersImageId) {
        print('_oldoffersImageId');
        print(id);
      }
      for (var id in _oldcouponsImageId) {
        print('_oldcouponsImageId');
        print(id);
      }
      for (var id in _old_VideoFileId) {
        print('_old_VideoFileId');
        print(id);
      }

       */


      try {
        print('5');
        print(CategoryType.toString());

        FormData formData = FormData.fromMap({
          'market_id': CategoryType.toString(),
          'offers': await getData(_OffersImage),
          'coupons': await getData(_CouponsImage),
          'oldoffers': _oldoffersImageId,
          'oldcoupons': _oldcouponsImageId,
        });

        print('3');
        print({GlopalApp.token});
        var response = await Dio().post(BASE_URL + ADD_OFFERS, data: formData,
            options: Options(
                method: 'POST', responseType: ResponseType.json, headers: {
              HttpHeaders.authorizationHeader: 'Bearer ${GlopalApp.token}'
            }));
          //  .timeout(Duration(seconds: 2000));
        print('yeeeeeeeeeeeees');
        print(jsonDecode(response.toString()));
        Map valueMap = jsonDecode(response.toString());
        if (valueMap["code"] == 200) {
          await  Provider.of<AddActivityProvider>(context,listen: false).getUserMarkets();
          await Dialogs().awsomeDialog(context: context,
            type: DialogType.SUCCES,
            title: translator.translate('ok'),
            desc: translator.translate('succes_add_offers'),
          );

          // Provider.of<HomeProvider>(context,listen: false).changeIndex(0);
          setEmptyData();
          setInit_validation();

          setState(() {
            _UserMarkets=[];
            myFutureUserMarket= getUserMarkets();
          });


        }
        else {
          await Dialogs().awsomeDialog(context: context,
            desc: translator.translate('general_error'),
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
          desc: translator.translate('general_error'),
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
        desc: translator.translate('valid_offers'),
        type: DialogType.ERROR,
        title: translator.translate('add_offers'),);
      setState(() {
        waitAddActivity=false;
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
          _selection=_UserMarkets[0].titleAr;
          CategoryType= _UserMarkets[0].id;

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
      var data = _UserMarkets.where((element) => element.id== id).first;
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
    try {
      setState(() {
        _oldcouponsImage = [];
        _oldcouponsImageId = [];
        _oldoffersImage = [];
        _oldoffersImageId = [];
        _old_VideoFileId=[];
        _old_VideoFile=[];
        _VideoFileList=[];
        _newofferimages=[];
        _newcouponsimages=[];

        if (item.offers != null && item.offers.length > 0) {
          for (var imagedata in item.offers) {
            var path = imagedata.path.toLowerCase();
            if (path.contains('.jpg') ||
                path.contains('.png') ||
                path.contains('.jpeg')) {
              _oldoffersImage.add(imagedata);
              _oldoffersImageId.add(imagedata.id);
            }
            else {
              _old_VideoFile.add(imagedata);
              _old_VideoFileId.add(imagedata.id);
            }
          }
        }
        if (item.coupons != null && item.coupons.length > 0) {
          bool firstlogo = false;
          for (var imagedata in item.coupons) {
            _oldcouponsImage.add(imagedata);
            _oldcouponsImageId.add(imagedata.id);
          }
        }

      });
    }
    catch(e){}
  }

  void setEmptyData()
  {
    setState(() {
      _newofferimages=[];
      _oldoffersImageId=[];
      _oldoffersImage=[];
      _newcouponsimages=[];
      _oldcouponsImage=[];
      _oldcouponsImageId=[];
      _VideoFileList=[];
      _old_VideoFileId=[];
      _old_VideoFile=[];
      waitAddActivity=false;
    });
  }

  bool validation()
  {

    if( (_oldoffersImage == null || _oldoffersImage.length==0 )&&
        (_newofferimages == null || _newofferimages.length==0 )&&
        (_oldcouponsImage == null || _oldcouponsImage.length==0 )&&
        (_newcouponsimages == null || _newcouponsimages.length==0 )&&
        (_old_VideoFile == null || _old_VideoFile.length==0 )&&
        (_VideoFileList == null || _VideoFileList.length==0 )
    )
    {
      setState(() {
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
      validData=true;
    });


  }
}

