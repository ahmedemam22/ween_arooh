import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:ween_arooh/model/citiesResponse.dart';
import 'package:ween_arooh/model/mainCategoryResponse.dart';
import 'package:ween_arooh/screens/locationView.dart';
import 'package:ween_arooh/services/provider/addActivityProvider.dart';
import 'package:ween_arooh/utils/BoxDecoration.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/widgets/addImageShape.dart';
import 'package:ween_arooh/widgets/bottomNavigationBar.dart';
import 'package:ween_arooh/widgets/button_shape.dart';
import 'package:ween_arooh/widgets/defaultImageShape.dart';
import 'package:ween_arooh/widgets/dropDown.dart';
import 'package:ween_arooh/utils/text_style.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/homeProvider.dart';
import 'package:ween_arooh/widgets/drawer.dart';
import 'package:ween_arooh/widgets/companyInfoShape.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/services/provider/offersProviders.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:ween_arooh/utils/glopal_app.dart';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/homeProvider.dart';
import 'package:ween_arooh/model/citiesResponse.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ween_arooh/network/constant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ween_arooh/network/api.dart';
import 'package:ween_arooh/utils/distance.dart';
import 'package:ween_arooh/network/constant.dart';


class NewAddActivity extends StatefulWidget {


  @override
  _NewAddActivityState createState() => _NewAddActivityState();
}

class _NewAddActivityState extends State<NewAddActivity> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>(); // ADD THIS LINE
  int CategoryType=0;
  List<Result> _items = List<Result>();
  String _selection="";
  Future myFuture;
  List<City> _Cityitems = List<City>();
  String _Cityselection="";
  int _CityID=0;
  Future CityFuture;
  double _CityLatitude;
  double _CityLongitude;
  TextEditingController companyName = new TextEditingController();
  TextEditingController LocationName = new TextEditingController();
  TextEditingController telephoneName = new TextEditingController();
  TextEditingController mobileName = new TextEditingController();
  TextEditingController emailName = new TextEditingController();
  TextEditingController websiteName = new TextEditingController();
  TextEditingController facebookName = new TextEditingController();
  TextEditingController twitterName = new TextEditingController();
  TextEditingController linkedinName = new TextEditingController();
  TextEditingController youtubeName = new TextEditingController();
  TextEditingController detailed_descriptionName = new TextEditingController();
  TextEditingController brief_descriptionName = new TextEditingController();
  File imageURICompany;
  bool waitAddActivity=false;
  List<File> _bannerImage;
  List<File> _logoImage;
  List<Asset> images = List<Asset>();



  @override
  void initState() {

    myFuture= getCategoryData();
    CityFuture= getCity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      backgroundColor:Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Center(child: Text(translator.translate('add_activity'))),
      ),
      drawer: AppDrawer(),
        body: new Container(
        child: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            choose_activity(),
            underline(),
            CompanyName(),
            underline(),
            Country(),
            underline(),
            Location(),
            underline(),
            Telephone(),
            underline(),
            Mobile(),
            underline(),
            Email(),
            underline(),
            WebSite(),
            underline(),
            FaceBook(),
            underline(),
            Twitter(),
            underline(),
            Youtube(),
            underline(),
            LinkedIn(),
            underline(),
            Brief_description(),
            underline(),
            Detailed_description(),
            underline(),
            Company_logo(),
            underline(),
            Main_banner(),
            underline(),
            saveButton(),

          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        )
          ),
          margin: const EdgeInsets.all(10),

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
                       AddActivity();
                    },

                child: ButtonShape(translator.translate('save'),backgroundColor)))),
      );
  }

  choose_activity()
  {
    return   Row(
      children: <Widget>[
        TitleInputText(translator.translate('choose_activity'), true),
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
                  onChanged: (newVal) {
                    var data = _items.where((element) => element.name== newVal).first;
                    if(data != null) {
                      setState(() {
                        CategoryType = data.id;
                        _selection= data.name;
                        print(CategoryType);
                        print(_selection);
                      });
                    }
                  },
                );
              }
          ),),),

          ],
    );
  }

  CompanyName()
  {
    return Row(
      children: [

        TitleInputText(translator.translate('company_name'), true),
        space(),
        DataInputType( TextField(
            keyboardType: TextInputType.text,
            controller: companyName,
            style: Style.TextStyle1,
            decoration: Style.InputDecoration1,
            minLines: 1,
            maxLines: 1,
          ),
        ),

      ],
    );

  }

  Country()
  {
    return   Row(
      children: <Widget>[
        TitleInputText(translator.translate('country'), true),
        space(),
        DataInputType(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: Style.BoxDecoration1,
            child:  FutureBuilder<List<City>>(
                future: CityFuture,
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());
                  return    DropdownButton(
                    icon: Icon(
                      Icons.arrow_drop_down_circle_sharp,
                    ),
                    hint: new Text(_Cityselection, style: TX_STYLE_black_14Point5, ),
                    underline: Container(
                      height: 0,
                    ),
                    isExpanded: true,
                    isDense: true,
                    items: _Cityitems.map((item) {
                      return new DropdownMenuItem(
                        child: new Text(item.nameAr, style: TX_STYLE_black_14Point5),
                        value: item.nameAr,
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      var data = _Cityitems.where((element) => element.nameAr== newVal||element.nameEn== newVal).first;
                      if(data != null) {
                        setState(() {
                          _CityID = data.id;
                          _Cityselection= data.nameAr;
                          _CityLatitude = double.tryParse(data.latitude) ?? 0.0;
                          _CityLongitude=double.tryParse(data.longitude) ?? 0.0;
                          print(_CityID);
                          print(_Cityselection);
                          print(_CityLatitude);
                          print(_CityLongitude);
                        });
                      }
                    },
                  );
                }
            ),),),

      ],
    );
  }

  Location()
  {
    return Row(
      children: [

        TitleInputText(translator.translate('administration_location'), true),
        space(),
        DataInputType( InkWell( onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  LocationView(
                    savedLocation: saveLocation,
                    initialPosition: LatLng(_CityLatitude, _CityLongitude),
                  )));
        } ,child: TextField(
          keyboardType: TextInputType.text,
          controller: LocationName,
          style: Style.TextStyle1,
          decoration: Style.InputDecoration1,
          minLines: 1,
          maxLines: 1,
          enabled: false,

        ),
        ),
        )

      ],
    );




  }

  Telephone()
  {
    return Row(
      children: [

        TitleInputText(translator.translate('telephone'), false),
        space(),
        DataInputType( TextField(
          keyboardType: TextInputType.phone,
          controller: telephoneName,
          style: Style.TextStyle1,
          decoration: Style.InputDecoration1,
          minLines: 1,
          maxLines: 1,
        ),
        ),

      ],
    );

  }

  Mobile()
  {
    return Row(
      children: [

        TitleInputText(translator.translate('mobile'), true),
        space(),
        DataInputType( TextField(
          keyboardType: TextInputType.phone,
          controller: mobileName,
          style: Style.TextStyle1,
          decoration: Style.InputDecoration1,
          minLines: 1,
          maxLines: 1,
        ),
        ),

      ],
    );

  }

  Email()
  {
    return Row(
      children: [

        TitleInputText(translator.translate('email'), false),
        space(),
        DataInputType( TextField(
          keyboardType: TextInputType.text,
          controller: emailName,
          style: Style.TextStyle1,
          decoration: Style.InputDecoration1,
          minLines: 1,
          maxLines: 1,
        ),
        ),

      ],
    );

  }

  WebSite()
  {
    return Row(
      children: [

        TitleInputText(translator.translate('website'), false),
        space(),
        DataInputType( TextField(
          keyboardType: TextInputType.text,
          controller: websiteName,
          style: Style.TextStyle1,
          decoration: Style.InputDecoration1,
          minLines: 1,
          maxLines: 1,
        ),
        ),

      ],
    );

  }

  FaceBook()
  {
    return Row(
      children: [

        TitleInputText('facebook', false),
        space(),
        DataInputType( TextField(
          keyboardType: TextInputType.text,
          controller: facebookName,
          style: Style.TextStyle1,
          decoration: Style.InputDecoration1,
          minLines: 1,
          maxLines: 1,
        ),
        ),

      ],
    );

  }

  Youtube()
  {
    return Row(
      children: [

        TitleInputText('youtube', false),
        space(),
        DataInputType( TextField(
          keyboardType: TextInputType.text,
          controller: youtubeName,
          style: Style.TextStyle1,
          decoration: Style.InputDecoration1,
          minLines: 1,
          maxLines: 1,
        ),
        ),

      ],
    );

  }

  Twitter()
  {
    return Row(
      children: [

        TitleInputText('twitter', false),
        space(),
        DataInputType( TextField(
          keyboardType: TextInputType.text,
          controller: twitterName,
          style: Style.TextStyle1,
          decoration: Style.InputDecoration1,
          minLines: 1,
          maxLines: 1,
        ),
        ),

      ],
    );

  }

  LinkedIn()
  {
    return Row(
      children: [

        TitleInputText('linkedin', false),
        space(),
        DataInputType( TextField(
          keyboardType: TextInputType.text,
          controller: linkedinName,
          style: Style.TextStyle1,
          decoration: Style.InputDecoration1,
          minLines: 1,
          maxLines: 1,
        ),
        ),

      ],
    );

  }

  Brief_description()
  {
    return Row(
      children: [

        TitleInputText(translator.translate('brief_description') , false),
        space(),
        DataInputType( TextField(
          keyboardType: TextInputType.text,
          controller: brief_descriptionName,
          style: Style.TextStyle1,
          decoration: Style.InputDecoration1,
          minLines: 1,
          maxLines: 1,
        ),
        ),

      ],
    );

  }

  Detailed_description()
  {
    return Row(
      children: [

        TitleInputText(translator.translate('detailed_description'), false),
        space(),
        DataInputType(   TextField(
          keyboardType: TextInputType.multiline,
          controller: detailed_descriptionName,
          style: Style.TextStyle1,
          decoration: Style.InputDecoration1,
          minLines: 3,
          maxLines: 3,
        ),
        ),

      ],
    );

  }

  Company_logo()
  {
    return Row(
      children: [

        TitleInputText(translator.translate('company_logo'), true),
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
                                        height: SizeConfig.screenWidth*s90,
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

        TitleInputText(translator.translate('main_banner'), true),
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
                SizedBox(width: SizeConfig.screenWidth*s20,),
                if(images != null)Expanded(
                  child: Container(
                    height: SizeConfig.screenWidth*s90,
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

  TitleInputText(String Txt,bool required)
  {
    return Expanded(
      flex: 1,
      child:RichText(
        text: new TextSpan(
          style: TX_STYLE_black_15.copyWith(fontWeight: FontWeight.bold),
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

  saveLocation(LatLng Location, String address) {

    if (Location==null){
      Location=LatLng(_CityLatitude,_CityLongitude);
    }
    Provider.of<AddActivityProvider>(context,listen: false).setAdminLoication(Location,address);
    if(address!=null){
      print(address);
      print(address);
      setState(() {
        LocationName.text= address;
      });
    }
  }

  Future getImageFromGallery() async {

    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageURICompany = image;
      print(imageURICompany.path);
    });
  }

  Future<List<Result>> getCategoryData ()async
  {
    var data = await Provider.of<HomeProvider>(context, listen: false).mainCategoryItems;
    if(data != null)
    {
      setState(() {
        _items=   data  ;
        _selection=_items[0].name;
        CategoryType= _items[0].id;
      });
      return data;

    }
    else
    {
      return new List< Result>();
    }

  }

  Future<List<City>> getCity ()async
  {

    var data = await  Provider.of<HomeProvider>(context,listen: false).citiesList;
    if(data != null)
    {
      setState(() {
        _Cityitems=   data  ;
        _Cityselection=_Cityitems[0].nameAr;
        _CityID= _Cityitems[0].id;
        _CityLatitude = double.tryParse(_Cityitems[0].latitude) ?? 0.0;
        _CityLongitude=double.tryParse(_Cityitems[0].longitude) ?? 0.0;
      });
      return data;

    }
    else
    {
      return new List< City>();
    }

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

  Future<List<MultipartFile>>getData(List list)async{
    List<MultipartFile>item=[];
    for(int i=0;i<list.length;i++){
      item.add(await MultipartFile.fromFile(list[i].path, filename:list[i].path.split('/').last,));

    }

    return item;
  }

  AddActivity ()async
  {
    setState(() {
      waitAddActivity=false;
    });
    print('1');
    if(images != null) {
      _bannerImage=[];
      for (Asset asset in images) {
        final filePath = await FlutterAbsolutePath.getAbsolutePath(
            asset.identifier);
        _bannerImage.add(File(filePath));
      }
    }
    print('2');
    if(imageURICompany != null)
      {
        _logoImage =[];
        _logoImage.add(imageURICompany);
      }


  try {
    print('4');
  FormData formData = FormData.fromMap({
    'region_id':_CityID.toString(),
    'title_ar':companyName.text,
    'min_dec_ar':brief_descriptionName.text,
    'dec_ar':detailed_descriptionName.text,
    'latitude':_CityLatitude.toString(),
    'longitude':_CityLongitude.toString(),
    'location':_Cityselection,
    'site_link': websiteName.text,
    'email':emailName.text,
    'facebook':facebookName.text,
    'youtube':youtubeName.text,
    'twitter': twitterName.text,
    'linkedin':linkedinName.text,
    'category_id':CategoryType.toString(),
    'admin_id':GlopalApp.user.id,
    'banners':await getData(_logoImage),
    'logos': await getData(_logoImage)
  });
  print('3');
  var response=await   Dio().post(BASE_URL +ADD_ACTIVITY ,data:formData,
      options: Options(method: 'POST', responseType: ResponseType.json,headers:{
        HttpHeaders.authorizationHeader: 'Bearer ${GlopalApp.token}'
      }))
      .timeout(Duration(seconds: 2000));
  print('yeeeeeeeeeeeees');
  print(jsonDecode(response.toString()));
  Map valueMap = jsonDecode(response.toString());
    setState(() {
      waitAddActivity=false;
    });
  }
  catch(e)
    {
      print("add activity error ::$e");
      setState(() {
        waitAddActivity=false;
      });
    }


/*



      _waitAddActivity=false;
      notifyListeners();
      await Dialogs().awsomeDialog(context: context,desc: "تم اضافة نشاطك بنجاح",type:DialogType.SUCCES,title:"اضف نشاطك",);
      print(jsonDecode(response.toString()));
      Map valueMap = jsonDecode(response.toString());

      if (valueMap['code'] == 200 && valueMap['message'] == 'success') {
        _data={};
        _logoImage=[];
        _bannerImage=[];
        category='';
        getUserMarkets();
      }
      else if(valueMap['code'] == 400 && valueMap['message'] == 'success'){
        print(valueMap['result']);
        print(valueMap['code'] );
      }
    }
    catch(e){
      print("add activity error ::$e");

    }
    finally{
      setState(() {
        waitAddActivity=false;

      });
    }

     */
  }
}
