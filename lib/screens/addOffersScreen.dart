import 'package:flutter/material.dart';
import 'package:ween_arooh/widgets/drawer.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/AddOffersProvider.dart';
import 'package:ween_arooh/widgets/addImageShape.dart';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:ween_arooh/widgets/button_shape.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
class AddOffersScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,

          title: Center(child: Text(translator.translate('add_offers'))),
        ),
        key: _scaffoldKey,
        drawer: AppDrawer(),
        body:
       Container(
            color: Colors.white,
         padding:  EdgeInsets.only(top: SizeConfig.screenWidth * s30),
            child:  Consumer<AddOffersProvider>(
                builder: (context, add, child) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * s20),
                        child: Column(
                          children: [


                            AddImageShape(title: translator.translate(
                                'add_offers'),
                                images: add.offerImage,
                                onSelectImage: add.addOffers,
                            onRemoveImage: add.removeOffers,),
                            SizedBox(
                              height: SizeConfig.screenWidth * s10,),


                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal:SizeConfig.screenWidth*s20),
                          child: AddImageShape(title: translator.translate('add_copoun'),addCoupoun: true,images: add.copounImage,onSelectImage: add.addCopoun,
                          onRemoveImage: add.removeCopoun,),
                        ),

                      ),

                      Padding(
                        padding:  EdgeInsets.symmetric(vertical:SizeConfig.screenWidth*s70),
                        child: Container(
                            width: SizeConfig.screenWidth*s175,
                            height:  SizeConfig.screenWidth*s70,
                            child:  Center(child:add.waitAddOffer?CircularProgressIndicator(): InkWell(
                                onTap: ()async{
                                  if(add.offerImage.length==0&&add.copounImage.length==0){
                                    Dialogs().awsomeDialog(context: context,title: translator.translate('sorry'),desc: translator.translate('valid_offers'),type: DialogType.ERROR);
                                  }



                              else {
                                    await add.addOffer(context);
                                  }


                                },

                                child: ButtonShape(translator.translate('save'),backgroundColor)))),
                      ),

                    ],
                  );
                }),
          ),
        )


    );
  }
}
