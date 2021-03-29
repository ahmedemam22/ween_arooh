import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/customDropDown.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/services/provider/homeProvider.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/widgets/searchTextField.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ween_arooh/widgets/dropDown.dart';
import 'package:ween_arooh/services/provider/offersProviders.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/addActivityProvider.dart';

class AppBarShape extends StatefulWidget {
  final String title;
  final Function onChange;
  final Function onChangeOffer;
  final bool back;
  final GlobalKey<ScaffoldState> openDrawer;

  AppBarShape({this.title, this.openDrawer, this.onChange,this.back=true, this.onChangeOffer});

  @override
  _AppBarShapeState createState() => _AppBarShapeState();
}

class _AppBarShapeState extends State<AppBarShape> {
  final GlobalKey dropdownKey = GlobalKey();
  var  dropdown;
  @override
  Widget build(BuildContext context) {
    dropdown = DropdownButton<int>(
      key: dropdownKey,
      items: setItems(context)
      ,
      onChanged: (int value) {
        print(value);
        print('ssssssssssssss');
        Provider.of<OffersProvider>(context,listen: false).locationSearch(value);


      },
    );

    return Container(
      height: SizeConfig.screenWidth*s125,
      color: backgroundColor,
      child: Padding(
        padding:  EdgeInsets.only(top:SizeConfig.screenWidth*s50,left: SizeConfig.screenWidth*s14,
            right: SizeConfig.screenWidth*s14),
        child: Column(
          children: [
            Text(widget.title,style: TextStyle(
              fontSize: SizeConfig.screenWidth*s20,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(
              height: SizeConfig.screenWidth*s10,
            ),
            Row(
              children: [
              InkWell(
                  onTap: widget.openDrawer.currentState.openDrawer,
                  child: Icon(Icons.menu,color: Colors.white,size: SizeConfig.screenWidth*s35,)),
SizedBox(width:SizeConfig.screenWidth*s10 ,),
   Center(
     child: Container(
                          height: SizeConfig.screenWidth*s30,

                          child: ClipRect(
                            child: Row(
                              children: [

                                Container(
                                      width:widget.title==translator.translate('offers')?SizeConfig.screenWidth*(s175):SizeConfig.screenWidth*(s200+s90),
                                      child:

                                  SearchTextField(widget.onChange)),
                                if(widget.title==translator.translate('offers'))SizedBox(width: 10,),
                                if(widget.title==translator.translate('offers'))offersShape(context)



  ]  ),
                          ),
                        ),
   ),
              if(widget.back)SizedBox(width:SizeConfig.screenWidth*s15),

              if(widget.back)  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,))

              ],
                ),


              ],
            )

        ),

    );
  }

  Widget offersShape(context){
    return   InkWell(
      onTap: openDropdown,

      child: Container(
          width: SizeConfig.screenWidth*(s120),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:5.0,horizontal: 2),
            child: Row(
              children: [
             Text(translator.translate('region')),
                Offstage(child: dropdown),
                SizedBox(width: 5,),
                SvgPicture.asset(

                  "assets/images/region_search.svg",
                  width: SizeConfig.screenWidth*s15,
                ),
              ],
            ),
          )),
    );
  }

  void openDropdown() {
    GestureDetector detector;
    void searchForGestureDetector(BuildContext element) {
      element.visitChildElements((element) {
        if (element.widget != null && element.widget is GestureDetector) {
          detector = element.widget;
          return false;

        } else {
          searchForGestureDetector(element);
        }

        return true;
      });
    }

    searchForGestureDetector(dropdownKey.currentContext);
    assert(detector != null);

    detector.onTap();
  }
  List<DropdownMenuItem<int>> setItems(context){
   var item=Provider.of<HomeProvider>(context,listen: false).citiesList;
   if( Provider.of<HomeProvider>(context,listen: false).citiesList!=null) {
  return List<DropdownMenuItem<int>>.generate(
     item.length,

           (int index) => DropdownMenuItem<int>(
         value: item[index].id,
         child: Column(
           children: [
             Center(child: new Text(translator.currentLanguage=='ar'?item[index].nameAr:item[index].nameEn)),
             Divider()
           ],
         ),
       ));


   }


  }
}
