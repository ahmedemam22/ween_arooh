import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/widgets/searchTextField.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter_svg/svg.dart';

class AppBarShape extends StatelessWidget {
  final String title;
  final Function onChange;
  final Function onChangeOffer;
  final bool back;
  final GlobalKey<ScaffoldState> openDrawer;
  AppBarShape({this.title, this.openDrawer, this.onChange,this.back=true, this.onChangeOffer});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenWidth*s125,
      color: backgroundColor,
      child: Padding(
        padding:  EdgeInsets.only(top:SizeConfig.screenWidth*s50,left: SizeConfig.screenWidth*s14,
            right: SizeConfig.screenWidth*s14),
        child: Column(
          children: [
            Text(title,style: TextStyle(
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
                  onTap: openDrawer.currentState.openDrawer,
                  child: Icon(Icons.menu,color: Colors.white,size: SizeConfig.screenWidth*s35,)),
SizedBox(width:SizeConfig.screenWidth*s10 ,),
   Center(
     child: Container(
                          height: SizeConfig.screenWidth*s30,
                          
                          child: ClipRect(
                            child: Row(
                              children: [

                                Container(
                                      width:title==translator.translate('offers')?SizeConfig.screenWidth*(s175):SizeConfig.screenWidth*(s200+s90),
                                      child:

                                  SearchTextField(onChange)),

                                if(title==translator.translate('offers'))
                                  SizedBox(width: SizeConfig.screenWidth*s10,),
                                if(title==translator.translate('offers'))offersShape()



                              ],
                            ),
                          ),
                        ),
   ),
              if(back)SizedBox(width:SizeConfig.screenWidth*s15),

              if(back)  InkWell(
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
  Widget offersShape(){
    return   Container(
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
              SizedBox(width: 5,),
              SvgPicture.asset(

                "assets/images/region_search.svg",
                width: SizeConfig.screenWidth*s15,
              ),
            ],
          ),
        ));
  }

}
