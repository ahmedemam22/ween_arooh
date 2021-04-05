import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ween_arooh/widgets/drawer.dart';
import 'package:ween_arooh/widgets/rate_shape/rateHeader.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketDetailsProvider.dart';
import 'package:ween_arooh/widgets/rate_shape/percentShape.dart';
import 'package:ween_arooh/widgets/reviewShape.dart';
import 'package:ween_arooh/widgets/button_shape.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/bottomNavigationBar.dart';
class RateScreen extends StatefulWidget {
  @override
  _RateScreenState createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    final marketId=  ModalRoute.of(context).settings.arguments;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(

          actions: [
            IconButton(icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,),onPressed: (){
              Navigator.pop(context);
            },)
          ],
          backgroundColor: backgroundColor,

          title: Center(child: Text(translator.translate('rate'))),
        ),
        key: _scaffoldKey,
        drawer: AppDrawer(),
        body:  FutureBuilder(
    future:   Provider.of<MarketDetailsProvider>(context,listen: false).getRates(),
    builder: (ctx, dataSnapshot) {
    if (dataSnapshot.connectionState ==
    ConnectionState.waiting) {
    return Center(child:CircularProgressIndicator());
    } else {
    if (dataSnapshot.error != null) {
    // ...
    // Do error handling stuff
    return Center(
    child: Text(translator.translate('error')),
    );
    } else {
    return Consumer<MarketDetailsProvider>(
    builder: (context, details, child) {
    return details.waitRate
    ? Center(child: CircularProgressIndicator())
        : ListView(children: [
    SizedBox(height: SizeConfig.screenWidth * s8),
    RateHeader(),
    PercentShape(),
    Divider(thickness: 2,),
    ReviewShape(),
    Align(
    alignment: Alignment.bottomCenter,

    child: InkWell(
    onTap: ()async{
   await Dialogs().rateDialog(context);
   await Dialogs().awsomeDialog(context:context, title:translator.translate('success'), type:DialogType.SUCCES,desc:translator.translate('success_rate'),
   onClick: Provider.of<MarketDetailsProvider>(context,listen: false).getRates()
   );


    },
    child: Container(
    color: lightGray,
    child: Center(

    child: Container(
    width: SizeConfig.screenWidth * s175,
    height: SizeConfig.screenWidth * s70,
    child: Center(child: ButtonShape(translator.translate('write_comment'),
    backgroundColor)),),
    ),
    ),
    ),
    ),


    ]);
    });
    }}})),
    );
  }
}
